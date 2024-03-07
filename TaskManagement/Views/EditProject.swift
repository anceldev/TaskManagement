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
    
    @State var selectedFruit: Fruit?
    @State var customPriority: Priority?
    
    //    @Query var tasks: [Taskp]
    
    init(project: Project, editProject: Bool = false) {
        self.project = project
        _editProject = State(initialValue: project.title.isEmpty)
        _editedProject = State(initialValue: project.copy())
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(project.title.isEmpty ? "Create\nproject" : "Edit \nproject")
                    .foregroundStyle(.white)
                    .clashDisplay(38, .medium)
                    .padding(.top, 17)
                VStack{
                    
                    CustomTextField(text: $editedProject.title, placeholder: "Title of project", systemImage: "pencil" , disabled: $editProject)
                    CustomTextField(text: $editedProject.proDescription, placeholder: "Description of project...", systemImage: "note.text", disabled: $editProject)
                    
                    TextEditor(text: $editedProject.proDescription)
                        .padding(10)
                        .foregroundStyle(editedProject.proDescription.isEmpty ? .textColor1 : .white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .scrollContentBackground(.hidden)
                        .overlay {
                            RoundedRectangle(cornerRadius: 11)
                                .stroke(.gray3, lineWidth: 1)
                        }
                        .disabled(!editProject)
                    HStack{
                        DatePicker("Deadline",
                                   selection: Binding(
                                    get: { editedProject.deadline ?? Date()},
                                    set: { editedProject.deadline = $0 }),
                                   in: .now...,
                                   displayedComponents: .date)
                        .disabled(!editProject)
                        Spacer()
                        CustomPicker(selection: $editedProject.priority, disabled: $editProject) {
                            Priority.allCases
                        }
                        .onChange(of: project.priority) {
                            print(project.priority.rawValue)
                        }
//                        .zIndex(1)
                    }
                    .frame(width: .infinity)
                    ColorPicker("Select a color", selection: $selectedColor)
                        .onChange(of: selectedColor) {
                            editedProject.colorHex = selectedColor.toHex()
                        }
                        .disabled(!editProject)
                        .zIndex(-1)
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
            .padding(.horizontal, 24)
            .background(.gray1)
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
        //        print(origin.priority.rawValue ?? "No picked")
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
