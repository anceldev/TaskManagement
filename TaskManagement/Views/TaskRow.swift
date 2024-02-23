//
//  TaskRow.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 23/2/24.
//

import SwiftUI

struct TaskRow: View {
    let project: Project
    var body: some View {
        NavigationLink(value: project){
            HStack {
                VStack {
                    Text("12:00")
                }
                VStack(alignment: .leading){
                    VStack(alignment: .leading) {
                        HStack {
                            Text(project.priority.rawValue)
                            Spacer()
                            Text("May 11, 2024")
                        }
                        HStack {
                            VStack {
                                Text(project.title)
                                Text(project.proDescription)
                            }
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    let project = Project(title: "Test project", proDescription: "Description of first project", priority: .normal, deadline: .now, progress: 0, colorHex: "#101010")
    
    return TaskRow(project: project)
}
