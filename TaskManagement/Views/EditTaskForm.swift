//
//  EditTaskForm.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 24/2/24.
//

import SwiftUI

struct EditTaskForm: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    @Bindable private var project: Project
//    @State private var newTask: Taskp
    
    @State private var taskDescription = ""
    @State private var deadline = Date.now
    @State private var category = Category.all
    @State private var value = ValueTask.zero
    
    
    
    
    init(project: Project) {
        self.project = project
//        _newTask = State(initialValue: Taskp())
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                TextEditor(text: $taskDescription)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                DatePicker("Expirte date", selection: $deadline, in: .now...)
//                DatePicker("Expire date",
//                           selection: Binding(
//                            get: { deadline ?? Date()},
//                            set: { deadline = $0 }),
//                           in: .now...)
                //, displayedComponents: )
                HStack {
                    Text("Category:")
                    Spacer()
                    Picker("Category:", selection: $category) {
                        ForEach(Category.allCases, id: \.self) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                }
                HStack {
                    Text("Value")
                    Spacer()
                    Picker("Value:", selection: $value) {
                        ForEach(ValueTask.allCases, id:\.self) { value in
                            Text("\(value.rawValue)")
                                .tag(value)
                        }
                    }
                }
                Spacer()
                Button("Create"){
                    print("Creating task")
                    addTask()
                }
                .buttonStyle(.borderedProminent)
                .tint(.yellow)
            }
            .padding(20)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                        Text("Back")
                    }
                }
            }
        }
    }
    private func addTask() {
        guard taskDescription.isEmpty == false else { return }
        
        print(project.title)
        
        let newTask = Taskp(taskDescription: taskDescription, deadline: deadline, category: category, value: value)
        project.tasks.append(newTask)
        taskDescription = ""
    }
}

//#Preview {
//    EditTaskForm()
//}
