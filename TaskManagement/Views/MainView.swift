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
            ZStack{
                Color.tmBlack
                VStack {
                    Circle()
                        .fill(Color.primaryGreen)
                        .frame(width: 278, height: 278)
                        .blur(radius: 200) // Apply blur effect
                        .blendMode(.normal) // Apply pass-through effect
                    
                }
                
                VStack{
                    VStack(alignment: .leading) {
                        ForEach(projects) { project in
                            HStack {
                                TaskRow(project: project, path: $path)
                            }
                            .frame(maxWidth: .infinity)
//                            .frame(height: 102)
//                            .background(.gray1)
//                            .overlay {
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.primaryGreen, lineWidth: 1)
//                            }
                        }
                        .foregroundStyle(.white)
                        .navigationDestination(for: Project.self) { project in
                            EditProject(project: project)
                                .navigationBarBackButtonHidden()
                        }
                    }
                
                    Spacer()
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
