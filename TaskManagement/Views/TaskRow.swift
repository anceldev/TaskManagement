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
    @State private var isFavorite = false
    
    var body: some View {
        HStack {
            HStack{
                VStack {
                    Text("12:00")
                }
                VStack(alignment: .leading) {
                    HStack {
                        VStack {
                            Text(project.title)
                            Text(project.proDescription)
                        }
                        Spacer()
                        VStack {
                            Button {
                                //
                                print("favorite")
                            } label: {
                                Image(systemName: "bookmark.fill")
                                    .foregroundStyle(.primaryGreen)
                            }
                            .buttonStyle(.customCircleButton)
                            Spacer()
                        }
                    }
                }
                .frame(maxHeight: .infinity)
            }
            .padding(15)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 102)
        .background(.gray1)
        .background {
            Color.gray1
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.clear, lineWidth: 1)
        }
        .onTapGesture {
            path.append(project)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 7)
    }
}

#Preview {
    let project = Project(title: "Test project", proDescription: "Description of first project", priority: .normal, deadline: .now, progress: 0, colorHex: "#101010")
    @State var path = [Project]()
    
    return TaskRow(project: project, path: $path)
}
