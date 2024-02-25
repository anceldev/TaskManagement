//
//  TestsView.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 24/2/24.
//

import SwiftUI

struct TestsView: View {
    // background: radial-gradient(circle at 50% 50%, #055b5c, #0d4e4f, #104142, #113535, #112929, #0f1e1e, #091212, #000000);
    //    static let color0 = Color(hex: "055b5c")
    //    static let color1 = Color(hex: "0d4e4f")
    //    static let color2 = Color(hex: "104142")
    //    static let color3 = Color(hex: "113535")
    //    static let color4 = Color(hex: "112929")
    //    static let color5 = Color(hex: "0f1e1e")
    //    static let color6 = Color(hex: "091212")
    //    static let color7 = Color(hex: "000000")
    //
    //    let gradient = Gradient(colors: [color0, color1, color2, color3, color4, color5, color6, color7])
    static let color0 = Color(hex: "002311")
    static let color1 = Color(hex: "000000")
    static let color2 = Color(hex: "001402")
    let gradient = Gradient(colors: [color0, color1, color2])
    
    var body: some View {
        ZStack{
            //            RadialGradient(
            //                gradient: gradient,
            //                center: .topTrailing,
            //                startRadius: 1,
            //                endRadius: 800)
            //            .ignoresSafeArea(.all)
            
            Rectangle()
                .fill(RadialGradient(
                    gradient: gradient,
                    center: .topTrailing,
                    startRadius: 1,
                    endRadius: 100
                ))
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    TestsView()
}
