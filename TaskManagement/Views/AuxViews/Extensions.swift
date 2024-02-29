//
//  CustomButtom.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 25/2/24.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    var bg: Color // Background color of button
    var text: Color // Text color of button
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .opacity(configuration.isPressed ? 0.5 : 1)
            .fontWeight(.semibold)
            .foregroundStyle(text)
            .background(bg)
            .background(Color.blue) // Default background color
            .clipShape(Capsule())
    }
}
struct CustomCircleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 44, height: 44)
            .background(.tmBlack)
            .clipShape(Circle())
            .overlay {
               Circle()
                    .stroke(.gray3, lineWidth: 1)
            }
    }
}
struct CustomTextFied: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minHeight: 49)
            .overlay {
                RoundedRectangle(cornerRadius: 11)
                    .stroke(.gray3, lineWidth: 1)
            }
    }
}
extension ButtonStyle where Self == CustomButton {
    static func customButton(bg: Color = .primaryGreen, text: Color = .black) -> CustomButton {
        CustomButton(bg: bg, text: text)
    }
}
extension ButtonStyle where Self == CustomCircleButton {
    static var customCircleButton: CustomCircleButton { .init() }
}
extension View {
    func customTextField() -> some View {
        modifier(CustomTextFied())
    }
}

extension Image {
    func customSize(_ size: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: size, height: size)
    }
}

// Example usage
#Preview {
    @State var test = ""
    return VStack {// Example of custom circle button
        Spacer()
        HStack {
            Image(systemName: "person")
                .customSize(24)
                .foregroundStyle(.primaryGreen)
            TextField("Test", text: $test)
                .padding(.leading, 12)
        }
        .padding(12)
        .customTextField()
        Button{
            //
        } label: {
            //
            Image(systemName: "bell")
                .resizable()
                .frame(width: 22, height:  22)
                .foregroundStyle(.white)
        }
        .buttonStyle(.customCircleButton)
        Button{
            //
        } label: {
            //
            Image(systemName: "arrow.left")
                .resizable()
                .frame(width: 12, height: 8)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .buttonStyle(.customCircleButton)
        // Example of custom capsule button
        Button("Press Me") {
            // Add your action here
        }
        .buttonStyle(.customButton())
        Spacer()
    }
    .padding(20)
//    .background(.tmBlack)
}

