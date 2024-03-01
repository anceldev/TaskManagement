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
struct CustomProgressBarStyle: ProgressViewStyle {
    var height: CGFloat = 5
    var isFavorite: Bool
    func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0.0
        
        return GeometryReader { geo in
            let gwidth = geo.size.width
            ZStack(alignment: .leading, content: {
                Capsule()
                    .frame(width: gwidth, height: height)
                    .opacity(0)
                    .overlay {
                        Capsule()
                            .stroke(lineWidth:1)
                            .foregroundStyle(isFavorite ? .primaryGreen : .white)
                    }
                Capsule()
                    .frame(width: min(CGFloat(progress) * gwidth, gwidth), height: height)
                    .foregroundStyle(isFavorite ? .primaryGreen : .white)
                    .overlay {
                        Capsule()
                            .fill(isFavorite ? .primaryGreen : .white)

                    }
            })
        }
        .frame(height: 10)
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
extension ProgressViewStyle where Self == CustomProgressBarStyle {
//    static var customProgressBar: CustomProgressBarStyle { .init() }
    static func customProgressBar(_ isFavorite: Bool = false) -> CustomProgressBarStyle {
        CustomProgressBarStyle(isFavorite: isFavorite)
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
        
        ProgressView(value: 0.8)
            .progressViewStyle(.customProgressBar())
        ProgressView(value: 0.8)
            .progressViewStyle(.customProgressBar(true))
        
        // Example of custom capsule button
        Button("Press Me") {
            // Add your action here
        }
        .buttonStyle(.customButton())
        Spacer()
    }
    .padding(20)
    .background(.tmBlack)
}

