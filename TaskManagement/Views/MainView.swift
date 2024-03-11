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
    @State private var searchText = ""
    
    var searchResults: [Project] {
        if searchText.isEmpty {
            return projects
        } else {
            return projects.filter{ $0.title.contains(searchText)}
        }
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .topTrailing){
                Color.tmBlack
                    .ignoresSafeArea(.all)
                VStack {
                    Circle()
                        .fill(Color.primaryGreen)
                        .frame(width: 278, height: 278)
                        .blendMode(.normal).opacity(0.3) // Apply pass-through effect
                        .blur(radius: 140)
                        .offset(x: 55, y: -56)
                        .ignoresSafeArea(edges: .top)
                }
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        
                    SearchBar(searchText: $searchText)
                        .padding(.vertical, 24)
                    Text("Show Results")
                        .clashDisplay(24, .medium)
                        .foregroundStyle(.white)
                        .padding(.bottom, 7)
                    }
                    .padding(.horizontal, 24)
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        VStack {
                            ForEach(searchResults) { project in
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
                        Spacer()
                        
                    }
                    .padding(.horizontal, 24)
                    .navigationBarTitleDisplayMode(.inline)
                    .sheet(isPresented: $addNewProject, content: {
                        Text("It's trying to add a new project")
                    })
                }
            }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: addTask, label: {
                        Image(systemName: "plus")
                    })
                    .buttonStyle(.customCircleButton(size: 44))
                }
                ToolbarItem(placement: .principal) { Text("Projects")
                        .foregroundStyle(.white)
                        .clashDisplay(28, .medium)
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        print("House")
                    } label: {
                        Image(systemName: "house")
                            .foregroundStyle(.primaryGreen)
                    }
                }
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
