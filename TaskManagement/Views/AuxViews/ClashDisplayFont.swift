//
//  CashDisplayFont.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 1/3/24.
//

import SwiftUI
import Foundation
enum StyleFontsClashDisplay: String {
    case semibold = "Semibold"
    case medium = "Medium"
    case regular = "Regular"
}

struct ClashDisplayFont: ViewModifier {
    let size: CGFloat
    let style: String
    func body(content: Content) -> some View {
        content
            .font(.custom("ClashDisplay-\(style)", size: size))
    }
}

extension View {
    /** Custom modifier for each font, */
    func clashDisplay(_ size: CGFloat = 16,style: StyleFontsClashDisplay = .regular) -> some View {
        modifier(ClashDisplayFont(size: size, style: style.rawValue))
    }
}

#Preview {
    Text("Hello my friend")
        .clashDisplay(20,style: .semibold)
}
