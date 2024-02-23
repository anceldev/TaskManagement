//
//  EditProject.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import SwiftUI
import SwiftData

struct EditTaskView: View {
    let project: Project
    @State var step = Taskp()
    @State private var selectedColor = Color.white
    @State private var editTask = false
    @State private var showSaveButton = false
    @Binding var path: [Project]
    
    @State private var title = ""
    @State private var proDescription = ""
    @State private var priority = Priority.normal
    @State private var colorHex = ""
    
    
    var steps: [Taskp] {
        if let steps = project.tasks { return steps }
        else { return [] }
    }
    
    var body: some View {
        VStack{
            TextField("Project name", text: $title)
                .disabled(!editTask)
            TextField("Description", text: $proDescription)
                .disabled(!editTask)
            Picker("Priority", selection: $priority) {
                ForEach(Priority.allCases, id: \.self) { priority in
                    Text(priority.rawValue)
                        .tag(priority)
                }
            }
            .disabled(!editTask)
            DatePicker("Expire date",
                       selection: Binding(
                        get: { project.deadline ?? Date()},
                        set: { project.deadline = $0 }),
                       in: .now...,
                       displayedComponents: .date)
            .disabled(!editTask)
            ColorPicker("Select a color", selection: $selectedColor)
                .onChange(of: selectedColor) {
                    colorHex = selectedColor.toHex()
                }
                .disabled(!editTask)
            Section {
                HStack {
                    TextField("Step", text: $step.taskDescription)
                        .disabled(!editTask)
                    
                    Button(action: addStep) {
                        Image(systemName: "opticaldiscdrive.fill")
                    }
                    .frame(width: 40)
                    .buttonStyle(.borderedProminent)
                }
            }
            Section {
                List {
                    ForEach(steps) { step in
                        Text(step.taskDescription)
                    }
                }
            }
            if showSaveButton {
                withAnimation {
                    Button(action: saveChanges, label: {
                        Label("Save", systemImage: "opticaldiscdrive.fill")
                    })
                    .buttonStyle(.borderedProminent)
                }
            }
            
            
        }
        .padding(20)
        .toolbar {
            Button {
                editTask.toggle()
                withAnimation {
                    showSaveButton.toggle()
                }

            } label: {
                Label("Edit project", systemImage: editTask ? "pencil.slash" : "pencil")
                    .labelStyle(.iconOnly)
            }
        }
    }
    private func saveChanges(){
        print("saving changes")
    }
    private func addStep() {
        if step.taskDescription.isEmpty { return }
        project.tasks?.append(step)
        step = Taskp()
    }
}

#Preview {
    @State var path = [Project]()
    let example = Project(title: "Example task", proDescription: "Description of example task", priority: .normal, deadline: .now, progress: 0, steps: [])
    return EditTaskView(project: example, path: $path)
        .modelContainer(DataController.previewContainer)
}
