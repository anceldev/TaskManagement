//
//  EditTaskForm.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 24/2/24.
//

import SwiftUI

struct EditTaskForm: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var task: Taskp
    
    init() {
        _task = State(initialValue: Taskp())
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Category:")
                Spacer()
                Picker("Category:", selection: $task.category) {
                    ForEach(Category.allCases, id: \.self) { category in
                        Text(category.rawValue)
                    }
                }
            }
            TextEditor(text: $task.taskDescription)
            
            
            Button("Create"){
                print("Creating task")
            }
            .buttonStyle(.borderedProminent)
            .tint(.yellow)
        }
        .padding(20)
    }
}

#Preview {
    EditTaskForm()
}
