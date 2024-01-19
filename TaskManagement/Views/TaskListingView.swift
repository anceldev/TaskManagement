//
//  ProjectListingView.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import SwiftUI
import SwiftData

struct TaskListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query var tasks: [TaskM]
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                HStack {
                    NavigationLink(value: task) {
                        Text(task.name)
                    }
                }
            }
        }
    }
    private func deleteProject(_ indexSet: IndexSet) {
        for index in indexSet {
            let task = tasks[index]
            modelContext.delete(task)
        }
    }
}

#Preview {
    TaskListingView()
}
