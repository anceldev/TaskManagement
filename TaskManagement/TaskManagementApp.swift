//
//  TaskManagementApp.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 19/1/24.
//

import SwiftUI
import SwiftData

@main
struct TaskManagementApp: App {
    
    /// Container configuration
    let container: ModelContainer = {
        let cont: ModelContainer!
        let schema = Schema([TaskM.self, Step.self])
        let configuration = ModelConfiguration("TaskManagementDB", schema: schema, isStoredInMemoryOnly: false, allowsSave: true)
        
        do {
            cont = try ModelContainer(for: schema, configurations: configuration)
        }
        catch {
            fatalError("Cannot create container")
        }
        return cont
    }()
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(self.container)
    }
}
