//
//  ContentView.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var path = [TaskM]()
    
    var body: some View {
        NavigationStack(path: $path) {
            TaskListingView()
//                .navigationDestination(for: TaskM.self, destination: EditTaskView.init)
                .navigationDestination(for: TaskM.self, destination: { taskm in
                    EditTaskView(taskm: taskm)
                })
                .toolbar {
                    Button("New Task", action: addTask)
                }
        }
    }
    func addTask() {
        let task = TaskM()
        modelContext.insert(task)
        path = [task]
    }
}
    

#Preview {
    MainView()
}
