//
//  ProjectListingView.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import SwiftUI
import SwiftData

struct TaskListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \TaskM.expireDate, order: .forward) var tasks: [TaskM]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Today's Tasks")
            }
            .padding(10)
            
            ForEach(tasks) { task in
                HStack {
                    NavigationLink(value: task) {
                        //                            Text(task.name)
                        TaskRow(taskm: task)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(.white)
        }
        .background(Color.tmBlack)
    }
    private func deleteProject(_ indexSet: IndexSet) {
        for index in indexSet {
            let task = tasks[index]
            modelContext.delete(task)
        }
    }
    @ViewBuilder
    func TaskRow(taskm: TaskM) -> some View {
        VStack {
            GeometryReader { geomtry in
                HStack {
                    VStack {
                        Text((taskm.expireDate?.formatted(.dateTime.hour()))!)
                    }
                    //                    .frame(width: geometry.size.width * 0.2)
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .trailing) {
                                Text((taskm.expireDate?.formatted(.dateTime.day()))!)
                            }
                        }
                        Text(taskm.name)
                        Text(taskm.taskDescription)
                    }
                    .foregroundStyle(Color.tmBlack)
                    //                    .frame(width: geometry.size.width * 0.8)
                    .background(Color.tmGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    TaskListingView()
        .modelContainer(DataController.previewContainer)
}
