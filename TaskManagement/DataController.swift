//
//  DataController.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 20/1/24.
//

import Foundation
import SwiftData

/**
 Custom model container for previews.
 */
@MainActor
class DataController {
    static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Project.self, Taskp.self, configurations: config)
            
            for i in 1...4 {
                let taskm = Project(title: "Project Nº: \(i)", proDescription: "This is the description for project number \(i)")
                container.mainContext.insert(taskm)
            }
            return container
        }
        catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }()
}
