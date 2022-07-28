//
//  ColorExtension.swift
//  NC2 William Yulio
//
//  Created by William Yulio on 21/07/22.
//

import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, opacity: opacity)
    }
}
