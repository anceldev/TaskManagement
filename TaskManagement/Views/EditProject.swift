//
//  TaskDetails.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 20/1/24.
//

import SwiftUI

struct EditProject: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var step = Taskp()
    @State private var selectedColor = Color.white
    
    @State private var showSaveButton = false
    @State private var showAvailableUsers = false
    
    var steps: [Taskp] {
        if let steps = project.tasks { return steps }
        else { return [] }
    }
    
    @Bindable var project: Project
    @State private var editedProject: Project
    @State private var editProject: Bool
    @State private var showConfirmationDialog = false
    @State private var showEmptyTitleDialog = false
    
    init(project: Project, editProject: Bool = false) {
        self.project = project
        //        self.editProject = editProject
        _editProject = State(initialValue: project.title.isEmpty)
        _editedProject = State(initialValue: project.copy())
    }
    
    var body: some View {
        NavigationView {
            VStack {
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
                    if showSaveButton {
                        withAnimation {
                            Button{
                                copyAttributes(from: editedProject, to: project)
                            } label: {
                                Label("Save", systemImage: "opticaldiscdrive.fill")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    Spacer()
                    Button("Delete", role: .destructive) {
                        showConfirmationDialog.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .confirmationDialog("You want to delete the project?", isPresented: $showConfirmationDialog, titleVisibility: .visible, actions: {
                Button("Yes", role: .destructive) {
//                    deleteProject()
                    modelContext.delete(project)
                    dismiss()
                }
                Button("Cancel", role: .cancel) {
                    showConfirmationDialog.toggle()
                }
            })
            .confirmationDialog("Title is required. You want to delete the project?", isPresented: $showEmptyTitleDialog, titleVisibility: .visible, actions: {
                Button("Yes", role: .destructive) {
//                    deleteProject()
                    modelContext.delete(project)
                    dismiss()
                }
                Button("No", role: .cancel) {
                    print("No action")
                }
            })
            .sheet(isPresented: $showAvailableUsers, content: {
                AvailableUsers(project: project)
            })
            .padding(20)
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
                        HStack{
                            Image(systemName: "chevron.backward")
                        }
                    }
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
        //                editedProject.steps = project.tasks
    }
    private func addStep() {
        if step.taskDescription.isEmpty { return }
        project.tasks?.append(step)
        step = Taskp()
    }
    //    private func saveChanges(){
    //        copyAttributes(from: editedProject, to: project)
    //    }
}

#Preview {
    @State var path = [Project]()
    let project = Project(title: "Test Task", proDescription: "Description of test task", priority: .normal, deadline: .now)
    return EditProject(project: project)
}
