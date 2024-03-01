//
//  CustomTextEditor.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 1/3/24.
//

import SwiftUI

struct CustomTextEditor: View {
    @Binding var text: String
    let systemImage: String?
    let image: Image?
    
    init(text: Binding<String>, systemImage: String? = nil) {
        UITextView.appearance().backgroundColor = .clear
        _text = text
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
        }
        .padding(15)
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
//#Preview {
//    @State var text = ""
//    return CustomTextEditor(text: $text, systemImage: "pencil")
//}
