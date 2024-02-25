//
//  Fonts.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 25/2/24.
//
import SwiftUI
import Foundation
enum StyleFonts: String {
    case medium = "Medium"
    case regular = "Regular"
    case light = "Light"
    case thin = "Thin"
    case italic = "Italic"
    case lightItalic = "LightItalic"
}

struct WorkSansFont: ViewModifier {
    let size: CGFloat
    let style: String
    func body(content: Content) -> some View {
        content
            .font(.custom("WorkSans-\(style)", size: size))
    }
}

extension View {
    /** Custom modifier for each font, */
    func workSans(_ size: CGFloat = 16,style: StyleFonts = .regular) -> some View {
        modifier(WorkSansFont(size: size, style: style.rawValue))
    }
}
