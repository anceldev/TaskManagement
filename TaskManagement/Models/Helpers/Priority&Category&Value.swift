//
//  Priority.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import Foundation

enum Priority: String, Codable, CaseIterable, Identifiable{
    case none = "None"
    case low = "Low"
    case normal = "Normal"
    case high = "High"
    var id: String { self.rawValue }
}
enum Category: String, Codable, CaseIterable, Identifiable {
    case all = "All"
    case study = "Study"
    case hobbie = "Hobbie"
    case job = "Job"
    var id: String { self.rawValue }
}
enum ValueTask: Int, Codable, CaseIterable {
    case zero = 0
    case one = 1
    case two = 2
    case tree = 3
}
