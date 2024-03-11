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
        HStack(alignment: .top, spacing: 0) {
            if let image = self.image {
                image
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.primaryGreen)
                    .padding(.top, 5)
                    .padding(.leading, 5)
            }
            ZStack(alignment: .topLeading) {
                if self.text.isEmpty {
                    Text("Placeholder")
                        .foregroundStyle(.gray3)
                        .padding(.top, 10)
                        .padding(.leading, 11)
                }
                
            TextEditor(text: $text)
                .scrollContentBackground(.hidden)
                .disabled(!self.disabled)
                .padding(.leading, 10)
            }
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .frame(height: 140)
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
    @State var disabled = true
    return VStack {
        CustomTextField(text: $text, systemImage: "note.text", disabled: $disabled)
        CustomTextEditor(text: $text, disabled: $disabled, systemImage: "note.text")
    }
    .background(.tmBlack)
}
