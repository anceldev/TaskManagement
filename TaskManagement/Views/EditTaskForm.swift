//
//  EditTaskForm.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 24/2/24.
//

import SwiftUI

struct EditTaskForm: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    @Bindable private var project: Project
//    @State private var newTask: Taskp
    
    @State private var taskDescription = ""
    @State private var deadline = Date.now
    @State private var category = Category.all
    @State private var value = ValueTask.zero
    @State private var disabled = true
    
    
    
    
    init(project: Project) {
        self.project = project
//        _newTask = State(initialValue: Taskp())
    }
    
    var body: some View {
        VStack(spacing: 0) {
//            NavigationStack{
                VStack(alignment: .leading, spacing: 0){
                    Text("Add\nTask")
                        .foregroundStyle(.white)
                        .clashDisplay(38, .medium)
                        .padding(.top, 17)
                        .padding(.bottom, 24)
//                    TextEditor(text: $taskDescription)
//                        .frame(maxWidth: .infinity, maxHeight: 100)
                    CustomTextEditor(text: $taskDescription, disabled: $disabled, systemImage: "note.text")
                    DatePicker("Expirte date", selection: $deadline, in: .now...)
                        .tint(.primaryGreen)
                    CustomPicker(selection: $category, disabled: $disabled) {
                        Category.allCases
                    }
                    .tint(.primaryGreen)
                    Spacer()
                    Button {
                        print("Creating task")
                        addTask()
                    } label: {
                        Text("Add")
                    }
                    .buttonStyle(.customButton())
                    
                }
                .padding(20)
                .background(.tmBlack)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                        }
                        .buttonStyle(.customCircleButton(size: 44))
                    }
                }
//            }
        }
        .background(.tmBlack)
    }
    private func addTask() {
        guard taskDescription.isEmpty == false else { return }
        
        project.tasks.append(Taskp(taskDescription: taskDescription, deadline: deadline, category: category))
        
        taskDescription = ""
        deadline = Date()
        category = .all
        dismiss()
    }
}

#Preview {
    @State var previewProject = Project()
    return EditTaskForm(project: previewProject)
        .preferredColorScheme(.dark)
}
