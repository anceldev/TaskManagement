//
//  EditProject.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import SwiftUI
import SwiftData

struct EditTaskView: View {
    @Bindable var taskm: TaskM
    @State var step = Step()

    var body: some View {
        Form {
            TextField("Project name", text: $taskm.name)
            TextField("Description", text: $taskm.taskDescription)
            Picker("Priority", selection: $taskm.priority) {
                ForEach(Priority.allCases, id: \.self) { priority in
                    Text(priority.rawValue)
                        .tag(priority)
                }
            }
            DatePicker("Expire date",
                       selection: Binding(
                        get: { taskm.expireDate ?? Date()},
                        set: { taskm.expireDate = $0 }),
                       in: .now...,
                       displayedComponents: .date)
            Section {
                HStack {
                    TextField("Step", text: $step.stepDescription)
                
                    Button(action: addStep) {
                        Image(systemName: "opticaldiscdrive.fill")
                    }
                    .frame(width: 40)
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
    private func addStep() {
        taskm.steps?.append(step)
        step = Step()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: TaskM.self, configurations: config)
        let example = TaskM(name: "Example task", taskDescription: "Description of example task", priority: .normal, expireDate: .now, progress: 0, steps: [])
        return EditTaskView(taskm: example)
            .modelContainer(container)
    }
    catch {
        fatalError("Failed to create model container for preview")
    }
}
