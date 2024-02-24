//
//  File.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 23/2/24.
//

import Foundation
import SwiftUI

/**
 https://www.swiftyplace.com/blog/modeling-data-in-swiftdata
 */
struct ColorData: Codable {
    var red: Double = 1
    var green: Double = 1
    var blue: Double = 1
    var opacity: Double = 1
    
    var color: Color {
        Color(red: red, green: green, blue: blue, opacity: opacity)
    }
    
    init(red: Double, green: Double, blue: Double, opacity: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.opacity = opacity
    }
    
    init(color: Color) {
        let environment = EnvironmentValues()
        let components = color.resolve(in: environment).cgColor.components
        if let components = components {
            if components.count > 0 {
                self.red = Double(components[0])
            }
            if components.count > 1 {
                self.green = Double(components[1])
            }
            if components.count > 2 {
                self.blue = Double(components[2])
            }
            if components.count > 3 {
                self.opacity = Double(components[3])
            }
        }
    }
}
