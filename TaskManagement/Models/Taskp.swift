//
//  Step.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import Foundation
import SwiftData

@Model
class Taskp {
    var taskDescription: String
    var completed: Bool
    var deadline: Date?
    var category: Category
    var user: User?
//    var project: Project?
    
//    init(taskDescription: String = "", completed: Bool = false, deadline: Date? = nil , category: Category = .all, value: Value = .zero, user: User? = nil, project: Project? = nil) {
    init(taskDescription: String = "", completed: Bool = false, deadline: Date? = nil , category: Category = .all, user: User? = nil) {
        self.taskDescription = taskDescription
        self.completed = completed
        self.deadline = deadline
        self.category = category
        self.user = user
//        self.project = project
    }
}
