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
    @Query(sort: \Project.deadline, order: .forward) var projects: [Project]
    //    @Binding var path: [Project]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ForEach(projects) { project in
                HStack {
                    TaskRow(project: project)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(.white)
            Spacer()
            
        }
    }
}

#Preview {
    @State var previewPath = [Project]()
    //    return TaskListingView(path: $previewPath)
    return TaskListingView()
        .modelContainer(DataController.previewContainer)
}
