//
//  Fonts.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 25/2/24.
//
import SwiftUI
import Foundation
enum StyleFonts: String {
    case semibold = "SemiBold"
    case medium = "Medium"
    case regular = "Regular"
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
#Preview {
    Text("abcd")
        .workSans(40, style: .semibold)
}
