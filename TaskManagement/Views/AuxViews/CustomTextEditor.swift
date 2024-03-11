//
//  CustomTextEditor.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 1/3/24.
//

import SwiftUI

struct CustomTextEditor: View {
    @Binding var text: String
    @Binding var disabled: Bool
    let systemImage: String?
    
    let image: Image?
    
    init(text: Binding<String>, disabled: Binding<Bool>, systemImage: String? = nil) {
        UITextView.appearance().backgroundColor = .clear
        self._text = text
        self._disabled = disabled
        self.systemImage = systemImage
        if let image = self.systemImage {
            self.image = Image(systemName: image)
        } else {
            image = nil
        }
    }
    
    var body: some View {
        HStack(alignment: .top) {
            if let image = self.image {
                image
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.primaryGreen)
            }
            TextEditor(text: $text)
                .scrollContentBackground(.hidden)
                .disabled(!self.disabled)
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .frame(height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 11))
        .overlay {
            RoundedRectangle(cornerRadius: 11)
                .stroke(.gray3, lineWidth: 1)
        }
    }
}
//
#Preview {
    @State var text = ""
    @State var disabled = false
    return VStack {
        CustomTextEditor(text: $text, disabled: $disabled, systemImage: "note.text")
    }
    .background(.tmBlack)
}
