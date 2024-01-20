//
//  TaskDetails.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 20/1/24.
//

import SwiftUI

struct TaskDetails: View {
    let taskm: TaskM
    @Binding var path: [TaskM]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    @State var path = [TaskM]()
    let taskm = TaskM(name: "Test Task", taskDescription: "Description of test task", priority: .normal, expireDate: .now)
    return TaskDetails(taskm: taskm, path: $path)
}
