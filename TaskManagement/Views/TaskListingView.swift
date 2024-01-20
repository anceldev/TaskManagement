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
    @Binding var path: [TaskM]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Today's Tasks")
                    .foregroundStyle(.white).bold()
            }
            .padding(10)
            ForEach(tasks) { taskm in
                HStack {
//                    NavigationLink(value: taskm) {
//                        TaskRow(taskm: taskm)
//                    }
                    TaskRow(taskm: taskm)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(.white)
            Spacer()
        }
        .background(Color.tmBlack)
    }
//    private func deleteProject(_ indexSet: IndexSet) {
//        for index in indexSet {
//            let task = tasks[index]
//            modelContext.delete(task)
//        }
//    }
    
    func editTaskM(for taskm: TaskM) {
        
    }
    @ViewBuilder
    func TaskRow(taskm: TaskM) -> some View {
        
        HStack {
            VStack {
                Text("12:00")
            }
            .frame(minWidth: 70, maxWidth: 70)
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    HStack {
                        Text(taskm.priority.rawValue)
                            
                            .font(.caption).bold()
                            .padding(.horizontal, 9)
                            .padding(.vertical, 5)
                            .background(.tmGreen.gradient)
                            .clipShape(Capsule())
                            .overlay {
                                Capsule()
                                    .stroke(.tmGray, lineWidth: 1       )
                            }
                            
                        Spacer()
                        Text("May 11, 2024")
                            .font(.caption2)
                            .fontWeight(.medium)
                            .foregroundStyle(.textGray)
                    }
                    HStack {
                        
                            VStack {
                                NavigationLink(value: taskm) {
                                    Text(taskm.name)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .font(.title3)
                                        .fontWeight(.medium)
                                        .foregroundStyle(.tmGray)
                                        .padding(.bottom, 1)
                                }
                                Text(taskm.taskDescription)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.caption2)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.textGray)
                            
                        }
//                        VStack {
//                            Text(taskm.name)
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .multilineTextAlignment(.leading)
//                                .font(.title3)
//                                .fontWeight(.medium)
//                                .foregroundStyle(.tmGray)
//                                .padding(.bottom, 1)
//                            Text(taskm.taskDescription)
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .font(.caption2)
//                                .fontWeight(.medium)
//                                .foregroundStyle(.textGray)
//                        }
                        VStack {
                            Button {
                                print("Edit tapped")
                                editTaskM(for: taskm)
                            } label: {
                                Image(systemName: "pencil.circle")
                                    .font(.title2)
                            }
                        }
                    }
                    
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .background(.tmGreen)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .foregroundStyle(.tmBlack)
                
            }
            .padding(.trailing, 20)
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    @State var previewPath = [TaskM]()
    return TaskListingView(path: $previewPath)
        .modelContainer(DataController.previewContainer)
}
