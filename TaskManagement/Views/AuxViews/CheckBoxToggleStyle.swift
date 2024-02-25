//
//  CheckBoxToggleStyle.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 25/2/24.
//

import SwiftUI

struct CheckBoxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

extension ToggleStyle where Self == CheckBoxToggleStyle {
    static var checkboxStyle: CheckBoxToggleStyle { .init() }
}
