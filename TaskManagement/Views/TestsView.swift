//
//  TestsView.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 24/2/24.
//

import SwiftUI

struct TestsView: View {

    var body: some View {
        VStack{
            Text("Hello, testing font")
                .workSans(20, style: .medium)
            Text("Hello, testing font")
                .workSans()
            Text("Hello, testing font")
                .workSans(30, style: .light)
        }
    }
}

#Preview {
    TestsView()
}
