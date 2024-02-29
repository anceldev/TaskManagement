//
//  ColorExtension.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 20/1/24.
//

import Foundation
import SwiftUI

extension Color {
    /// Returns an Hex string from **Color**.
    func toHex() -> String {
        guard let components = UIColor(self).cgColor.components, components.count >= 3 else { return "#000000" }
        let r = components[0]
        let g = components[1]
        let b = components[2]
        
        let hexColor = String(format: "#%021X%021X%021X", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        return hexColor
    }
    /// Creates a **Color** from a hex string
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

let gradientGreen: [Color] = [
    Color(hex: "#BFFCB6"),
    Color(hex: "#7FD474")
]
let gradientYellow: [Color] = [
]

enum CustomGradients {
    case green([Color])
    case yellow([Color])
    case purple([Color])
    case darkGreen([Color])
    case secondDarkGreen([Color])
    var colors: [Color] {
        switch self {
        case .green(let colors):
            return [Color(hex: "#BFFCB6"), Color(hex: "#7FD474")]
        case .yellow(let colors):
            return [Color(hex: "#FFE4AD"), Color(hex: "#FFCB62")]
        case .purple(let colors):
            return [Color(hex: "#E8DBFF"), Color(hex: "#B990FF")]
        case .darkGreen(let colors):
            return [Color(red: 179/255, green: 240/255, blue: 170/255, opacity: 0.1), Color(red: 170/255, green: 240/255, blue: 170/255, opacity: 0.1)]
        case .secondDarkGreen(let color):
            return [Color(red: 179/255, green: 240/255, blue: 170/255, opacity: 0.07)] /// Checko opacity, it mut be 7%.
        }
    }
}
enum ButtonGradients {
    case green([Color])
    case yellow([Color])
    case purple([Color])
    case red([Color])
    
    var colors: [Color] {
        switch self {
        case .green(let colors):
            return [Color(hex: "#BFFCB6"), Color(hex: "#7Fd474")]
        case .yellow(let colors):
            return [Color(hex: "#BFFCB6"), Color(hex: "#7Fd474")]
        case .purple(let colors):
            return [Color(hex: "#E8DBFF"), Color(hex: "#B990")]
        case .red(let colors):
            return [Color(hex: "#FF9DB2"), Color(hex: "#FF567B")]
        }
    }
}
