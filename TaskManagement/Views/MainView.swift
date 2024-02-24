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
                    //                    TaskListingView()
                    ForEach(projects) { project in
                        HStack {
                            TaskRow(project: project)
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
//    private func addUsers() {
//        let user1 = User(name: "Ancel", email: "ancel@mail.com")
//        let user2 = User(name: "Yamil", email: "yami@mail.com")
//        let user3 = User(name:"Marce", email: "marce@mail.com")
//        
//        modelContext.insert(user1)
//        modelContext.insert(user2)
//        modelContext.insert(user3)
//    }
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
