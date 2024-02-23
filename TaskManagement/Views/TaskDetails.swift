//
//  TaskDetails.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 20/1/24.
//

import SwiftUI

struct TaskDetails: View {
    let taskm: Project
    @Binding var path: [Project]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    @State var path = [Project]()
    let taskm = Project(title: "Test Task", proDescription: "Description of test task", priority: .normal, deadline: .now)
    return TaskDetails(taskm: taskm, path: $path)
}
