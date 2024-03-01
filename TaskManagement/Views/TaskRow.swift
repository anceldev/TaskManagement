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
    
    let starFill: some View = Image(systemName: "star.fill")
        .resizable()
        .frame(width: 12, height: 12)
    let starEmpty: some View = Image(systemName: "star")
        .resizable()
        .frame(width: 12, height: 12)
    
    var priority: some View {
        HStack(spacing: 2) {
            switch project.priority {
            case .low:
                starFill
                starEmpty
                starEmpty
            case .normal:
                starFill
                starFill
                starEmpty
            case .high:
                starFill
                starFill
                starFill
            }
        }
        .foregroundStyle(project.isFavorite ? .primaryGreen : .white)
    }
    
    var body: some View {
        HStack {
            HStack(spacing: 12){
                VStack {
                    RoundedRectangle(cornerRadius: 13)
                        .fill(.tmBlack)
                        .frame(width: 56, height: 56)
                }
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(project.title)
                                .foregroundStyle(.white)
                                .clashDisplay(20, .medium)
                            Spacer()
                            Text(project.proDescription)
                                .lineLimit(1)
                                .workSans(12, style: .regular)
                                .foregroundStyle(.textColor1)
                            Spacer()
                            ShortDetailsProject()
                        }
                        .padding(.top, 8)
                        .frame(height: 72)
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
                            .buttonStyle(.customCircleButton(size: 32))
                            Spacer()
                        }
                    }
                }
            }
            .padding(15)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 102)
        .background(.gray1)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(project.isFavorite ? .primaryGreen : .clear, lineWidth: 1)
        }
        .onTapGesture {
            path.append(project)
        }
        .padding(.vertical, 7)
    }
    @ViewBuilder
    func ShortDetailsProject() -> some View {
        let progress = CGFloat(CGFloat(project.progress) / 100)
        let dot = Image(systemName: "circle.fill")
            .resizable()
            .foregroundStyle(.gray4)
            .frame(width: 5, height: 5)
            .padding(.horizontal, 6)

        HStack(alignment: .center, spacing: 0) {
            Text(project.deadline!, format: .dateTime.day().month())
                .foregroundStyle(.white)
                .workSans(13, style: .medium)
            dot
            ProgressView(value: progress)
                .progressViewStyle(.customProgressBar(project.isFavorite))
                .frame(width: 40)
                .offset(y: 2.5)
            Text("\(project.progress)%")
                .foregroundStyle(.white)
                .workSans(13, style: .medium)
                .padding(.leading, 3)
            dot
            priority
                .padding(3)
                .clipShape(Capsule())
                .overlay {
                    Capsule()
                        .stroke(.gray3, lineWidth: 1)
                }
        }
        .frame(height: 18)
    }
}

#Preview {
    let project = Project(title: "Test project", proDescription: "Description of first project", priority: .normal, deadline: .now, progress: 35, colorHex: "#101010")
    @State var path = [Project]()
    
    return TaskRow(project: project, path: $path)
}
