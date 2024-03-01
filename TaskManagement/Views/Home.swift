//
//  Home.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 1/3/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.tmBlack)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    print("Notifications On")
                } label: {
                    Image(systemName: "bell")
                }
                .buttonStyle(.customCircleButton(size: 44))
            }
        }
    }
}

#Preview {
    Home()
}
