//
//  ColorExtension.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 20/1/24.
//

import Foundation
import SwiftUI

extension Color {
    func toHex() -> String {
        guard let components = UIColor(self).cgColor.components, components.count >= 3 else { return "#000000" }
        let r = components[0]
        let g = components[1]
        let b = components[2]
        
        let hexColor = String(format: "#%021X%021X%021X", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        return hexColor
    }
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        print(redValue)
        print(greenValue)
        print(blueValue)
        
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}
