//
//  TaskRow.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 23/2/24.
//

import SwiftUI

struct TaskRow: View {
    let project: Project
    @Binding var path: [Project]
    var body: some View {
        //        NavigationLink(value: project){
        HStack {
//            NavigationLink(value: project) {
                VStack {
                    Text("12:00")
                }
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        HStack {
                            VStack {
                                Text(project.title)
                                Text(project.proDescription)
                            }
                        }
                        HStack {
                            Text(project.priority.rawValue)
                            Spacer()
                            Text("May 11, 2024")
                        }
                    }
                }
//            }
        }
        .onTapGesture {
            path.append(project)
        }
    }
}

//#Preview {
//    let project = Project(title: "Test project", proDescription: "Description of first project", priority: .normal, deadline: .now, progress: 0, colorHex: "#101010")
//    
//    return TaskRow(project: project)
//}
