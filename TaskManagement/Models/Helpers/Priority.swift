//
//  Priority.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import Foundation

enum Priority: String, Codable, CaseIterable {
    case low = "Low"
    case normal = "Normal"
    case high = "High"
}
enum Category: String, Codable, CaseIterable {
    case cat1 = "Category 1"
    case cat2 = "Category 2"
    case cat3 = "Category 3"
}
