//
//  Task.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import Foundation
import SwiftData

@Model
class Project {
    var title: String
    var proDescription: String
    var priority: Priority
    var deadline: Date?
    var progress: Int
    var colorHex: String
    @Relationship(deleteRule: .cascade, inverse: \Taskp.taskm) var tasks: [Taskp]?
    
    init(title: String = "", proDescription: String = "", priority: Priority = .normal, deadline: Date? = .now, progress: Int = 0, colorHex: String = "", steps: [Taskp]? = []) {
        self.title = title
        self.proDescription = proDescription
        self.priority = priority
        self.deadline = deadline
        self.progress = progress
        self.tasks = steps
        self.colorHex = colorHex
    }
}
