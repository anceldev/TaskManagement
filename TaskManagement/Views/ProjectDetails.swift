//
//  EditProject.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import SwiftUI
import SwiftData

//struct ProjectDetails: View {
//    
//    @Environment(\.modelContext) var modelContext
//    @Environment(\.dismiss) var dismiss
//    
//    var project: Project
//    
//    @State var step = Taskp()
//    @State private var selectedColor = Color.white
//    @State private var editProject: Bool = false
//    @State private var showSaveButton = false
    
//    @Binding var path: [Project]
    
//    @State private var title = ""
//    @State private var proDescription = ""
//    @State private var priority = Priority.normal
//    @State private var colorHex = ""
//    @State private var showAvailableUsers = false
    
//    init(project: Project, editProject: Bool = false , path: Binding<[Project]>) {
//        self.project = project
//        _path = path
//    }
    
//    var steps: [Taskp] {
//        if let steps = project.tasks { return steps }
//        else { return [] }
//    }
    
//    var body: some View {
//        VStack{
//            Text(project.title)
//            Text(project.proDescription)
//            Text(project.priority.rawValue)
//            Text(project.deadline!, format: .dateTime)
//            Text(project.colorHex)
//        }
//        .sheet(isPresented: $editProject, content: {
//            EditProject(project: project)
//        })
//        .padding(20)
//        .toolbar {
//            ToolbarItem(placement: .topBarTrailing) {
//                Menu {
//                    Button(role: .none) {
//                        //
//                        print("Edit button")
//                    } label: {
//                        Label("Edit", systemImage: "pencil")
//                    }
//                    Button(role: .destructive) {
//                        print("Delete project")
//                    } label: {
//                        Label("Delete", systemImage: "trash")
//                    }
//                } label: {
//                    Image(systemName: "ellipsis.circle")
//                }
//            }
//        }
//    }
//}

//#Preview {
//    @State var path = [Project]()
//    let example = Project(title: "Example task", proDescription: "Description of example task", priority: .normal, deadline: .now, progress: 0, steps: [])
//    return ProjectDetails(project: example)
//        .modelContainer(DataController.previewContainer)
//}
