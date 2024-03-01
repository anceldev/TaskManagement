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
                VStack() {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text(project.title)
                            Text(project.proDescription)
                            Spacer()
                            ShortDetailsProject()
                        }
                        Spacer()
                        VStack {
                            Button {
                                //
                                withAnimation {
                                    project.isFavorite.toggle()
                                }
                            } label: {
                                Image(systemName: "bookmark.fill")
                                    .foregroundStyle(project.isFavorite ? .primaryGreen : .white)
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
//        .background {
//            Color.gray1
//        }
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
    @ViewBuilder
    func ShortDetailsProject() -> some View {
        let progress = CGFloat(CGFloat(project.progress) / 100)

        HStack(alignment: .center) {
            Text(project.deadline!, format: .dateTime.day().month())
                .foregroundStyle(.white)
                .workSans(13, style: .medium)
            Image(systemName: "circle.fill")
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 5, height: 5)
            ProgressView(value: progress)
                .progressViewStyle(.customProgressBar)
                .frame(width: 40)
                .offset(y: 2)
            Text("\(project.progress)%")
                .foregroundStyle(.white)
                .workSans(13, style: .medium)
            Image(systemName: "circle.fill")
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 5, height: 5)
        }
        .frame(height: 18)
    }
}

#Preview {
    let project = Project(title: "Test project", proDescription: "Description of first project", priority: .normal, deadline: .now, progress: 35, colorHex: "#101010")
    @State var path = [Project]()
    
    return TaskRow(project: project, path: $path)
}
