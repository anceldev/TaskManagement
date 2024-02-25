//
//  CustomButtom.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 25/2/24.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(14)
            .background(.tmYellow, in: RoundedRectangle(cornerRadius: 10))
            .opacity(configuration.isPressed ? 0.5 : 1)
            .fontWeight(.semibold)
    }
}

extension ButtonStyle where Self == CustomButton {
    static var customButton: CustomButton { .init() }
}

#Preview {
    Button(action: { print("Pressed") }) {
        Label("Press Me", systemImage: "star")
    }
    .buttonStyle(.customButton)
}
