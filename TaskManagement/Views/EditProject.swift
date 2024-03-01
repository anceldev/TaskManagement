//
//  TaskDetails.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 20/1/24.
//

import SwiftData
import SwiftUI

struct EditProject: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedColor = Color.white
    //    @State private var showSaveButton = false
    
    @Bindable var project: Project
    @State private var editedProject: Project
    
    @State private var editProject: Bool
    @State private var showConfirmationDialog = false
    @State private var showEmptyTitleDialog = false
    @State private var showNewTaskForm = false
    
//    @Query var tasks: [Taskp]
    
    init(project: Project, editProject: Bool = false) {
        self.project = project
        _editProject = State(initialValue: project.title.isEmpty)
        _editedProject = State(initialValue: project.copy())
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text(project.title.isEmpty ? "Create" : "Edit")
                    .foregroundStyle(.blue)
                VStack{
                    TextField("Project name", text: $editedProject.title)
                        .disabled(!editProject)
                    TextField("Description", text: $editedProject.proDescription)
                        .disabled(!editProject)
                    Picker("Priority", selection: $editedProject.priority) {
                        ForEach(Priority.allCases, id: \.self) { priority in
                            Text(priority.rawValue)
                                .tag(priority)
                        }
                    }
                    .disabled(!editProject)
                    DatePicker("Expire date",
                               selection: Binding(
                                get: { editedProject.deadline ?? Date()},
                                set: { editedProject.deadline = $0 }),
                               in: .now...,
                               displayedComponents: .date)
                    .disabled(!editProject)
                    ColorPicker("Select a color", selection: $selectedColor)
                        .onChange(of: selectedColor) {
                            editedProject.colorHex = selectedColor.toHex()
                        }
                        .disabled(!editProject)
                    VStack {
                        ForEach(project.tasks) { step in
                            VStack {
                                Text(step.taskDescription)
                                HStack {
                                    Text("Completed")
                                    Spacer()
                                    Toggle("Completed",
                                           isOn: Binding(
                                            get: { step.completed },
                                            set: { step.completed = $0 }))
                                    .toggleStyle(.checkboxStyle)
                                }
                            }
                        }
                    }
                    Button("Delete", role: .destructive) {
                        showConfirmationDialog.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                }
                Spacer()
            }
            .background(.tmBlack)
            .confirmationDialog("You want to delete the project?", isPresented: $showConfirmationDialog, titleVisibility: .visible, actions: {
                Button("Yes", role: .destructive) {
                    modelContext.delete(project)
                    dismiss()
                }
                Button("Cancel", role: .cancel) {
                    showConfirmationDialog.toggle()
                }
            })
            .confirmationDialog("Title is required. You want to delete the project?", isPresented: $showEmptyTitleDialog, titleVisibility: .visible, actions: {
                Button("Yes", role: .destructive) {
                    modelContext.delete(project)
                    dismiss()
                }
                Button("No", role: .cancel) {
                    print("No action")
                }
            })
            .sheet(isPresented: $showNewTaskForm, content: {
                EditTaskForm(project: project)
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        if project.title.isEmpty {
                            showEmptyTitleDialog.toggle()
                        }
                        else {
                            dismiss()
                        }
                    } label: {
                            Image(systemName: "chevron.backward")
                            .foregroundStyle(.white)
                    }
                    .buttonStyle(.customCircleButton(size: 44))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        editProject.toggle()
                        copyAttributes(from: editedProject, to: project)
                    } label: {
                        Label("Edit project", systemImage: editProject ? "opticaldiscdrive" : "pencil")
                            .labelStyle(.iconOnly)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    if editProject {
                        withAnimation {
                            Button {
                                print("Undo")
                                copyAttributes(from: project, to: editedProject)
                            } label: {
                                Label("Undo", systemImage: "arrow.uturn.backward.circle")
                                    .labelStyle(.iconOnly)
                            }
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showNewTaskForm.toggle()
                    } label: {
                        Label("Add", systemImage: "plus")
                            .labelStyle(.iconOnly)
                    }
                }
            }
            .onAppear {
                modelContext.undoManager = UndoManager()
            }
        }
    }
    private func copyAttributes(from origin: Project, to destiny: Project){
        destiny.title = origin.title
        destiny.proDescription = origin.proDescription
        destiny.priority = origin.priority
        destiny.deadline = origin.deadline
        destiny.progress =  origin.progress
        destiny.colorHex = origin.colorHex
        destiny.users = origin.users
    }
    
}

#Preview {
    @State var path = [Project]()
    let project = Project(title: "Test Task", proDescription: "Description of test task", priority: .normal, deadline: .now)
    return EditProject(project: project)
}
