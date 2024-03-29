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
    var isFavorite: Bool
    var colorHex: String
    @Relationship(deleteRule: .noAction, inverse: \User.projects) var users: [User] // Many to many relaitonship with User model
//    @Relationship(deleteRule: .cascade, inverse: \Taskp.project) var tasks: [Taskp]?
//    @Relationship(deleteRule: .cascade, inverse: \Taskp.project) var tasks: [Taskp]
    @Relationship(deleteRule: .cascade) var tasks = [Taskp]()
    
//    init(title: String = "", proDescription: String = "", priority: Priority = .normal, deadline: Date? = .now, progress: Int = 0, colorHex: String = "", users: [User] = [], steps: [Taskp] = []) {
    init(title: String = "", proDescription: String = "", priority: Priority = .none, deadline: Date? = .now, progress: Int = 0, isFavorite: Bool = false, colorHex: String = "", users: [User] = []) {
        self.title = title
        self.proDescription = proDescription
        self.priority = priority
        self.deadline = deadline
        self.progress = progress
        self.isFavorite = isFavorite
        self.colorHex = colorHex
        self.users = users
        
    }
    func copy() -> Project {
        let project = self
        let copiedProject = Project(
            title: project.title,
            proDescription: project.proDescription,
            priority: project.priority,
            deadline: project.deadline,
            progress: project.progress,
            colorHex: project.colorHex,
            users: project.users) //,
//            steps: project.tasks)
        return copiedProject
    }
}
