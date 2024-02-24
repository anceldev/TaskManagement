//
//  AvailableUsers.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 23/2/24.
//

import SwiftUI
import SwiftData

struct AvailableUsers: View {
    
    let project: Project
    @State private var usersToAdd = [User]()
    @Query(sort: \User.name) private var users: [User]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack{
                if !users.isEmpty {
                    ForEach(users) { user in
                        HStack {
                            Text(user.name)
                            Button("Add user to project") {
                                print("Adding to \(user.name)...")
                                usersToAdd.append(user)
                            }
                        }
                    }
                } else {
                    Text("No users in DB")
                }
                Button("Add users to project") {
                    addUsersToProject()
                    dismiss()
                }
            }
            .toolbar(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Hi")
                }
            }
        }
        
    }
    private func addUsersToProject() {
        for user in usersToAdd {
            print("Added user: \(user.name)...")
        }
        project.users = usersToAdd
        print("Users added")
    }
}

//#Preview {
//    AvailableUsers()
//}
