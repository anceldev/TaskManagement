//
//  CustomTextField.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 1/3/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: String
    let systemImage: String?
    @State private var image: Image?
    @Binding private var disabled: Bool
    
    init(text: Binding<String>, placeholder: String = "Text", systemImage: String? = nil, disabled: Binding<Bool>) {
        _text = text
        self.placeholder = placeholder
        self.systemImage = systemImage
        if let image = systemImage {
            _image = State(initialValue: Image(systemName: image))
        } else {
            _image = State(initialValue: nil)
        }
        _disabled = disabled
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            if let image = self.image {
                image
                    .resizable()
                    .foregroundStyle(.primaryGreen)
                    .frame(width: 24, height: 24)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 15)
            }
            TextField(text: $text) {
                Text(placeholder)
                    .foregroundStyle(text.isEmpty ? .textColor1 : .white)
            }
            .workSans(16, style: .regular)
            .foregroundStyle(text.isEmpty ? .textColor1 : .white)
            .disabled(!self.disabled)
//            .frame(width: .infinity)
            .padding(.leading, systemImage == nil ? 16 : 0)
            if disabled {
                Button {
                    print("Delete text")
                    self.text = ""
                } label: {
                    Image (systemName: "xmark")
                        .foregroundStyle(.white)
                }
                .buttonStyle(.customCircleButton(size: 32))
                .padding(.vertical, 12)
                .padding(.trailing, 10)
            }
        }
        .frame(height: 56)
//        .background(.gray1)
//        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 11))
        .overlay {
            RoundedRectangle(cornerRadius: 11)
                .stroke(.gray3, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    @State var text = ""
    @State var disabled = true
    return CustomTextField(text: $text, placeholder: "Placeholder", systemImage: nil, disabled: $disabled)
//        .background(.tmBlack)
}
