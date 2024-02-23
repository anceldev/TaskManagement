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
    @Query(sort: \Project.deadline, order: .forward) var projects: [Project]
    @State private var path = [Project]()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                HStack {
                    Text("Today's Tasks")
                        .foregroundStyle(.white).bold()
                }
                TaskListingView()
                    .navigationDestination(for: Project.self) { project in
                        EditTaskView(project: project, path: $path)
                    }
            }
            .toolbar {
                Button(action: addTask, label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                })
            }
            .background(.tmBlack)
            .navigationTitle("Today taks's")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func addTask() {
        let task = Project()
        modelContext.insert(task)
        path = [task]
    }
}
    

#Preview {
    MainView()
        .modelContainer(DataController.previewContainer)
}
