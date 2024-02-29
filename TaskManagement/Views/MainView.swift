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
    @State private var addNewProject = false
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack{
                VStack(alignment: .leading) {
                    ForEach(projects) { project in
                        HStack {
                            TaskRow(project: project, path: $path)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundStyle(.white)
                    .navigationDestination(for: Project.self) { project in
                        EditProject(project: project)
                            .navigationBarBackButtonHidden()
                    }
                }
                .toolbar {
                    Button(action: addTask, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .navigationTitle("Today taks's")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $addNewProject, content: {
                Text("It's trying to add a new project")
            })
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
