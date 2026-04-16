//
//  Color+Ext.swift
//  MyDay
//
//  Created by Maxim Vershinin on 16.04.2026.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }

    // MARK: - Фоны
    static let appBg       = Color(hex: "#0E0F14")
    static let appSurface  = Color(hex: "#16171F")
    static let appSurface2 = Color(hex: "#1E2029")
    static let appSurface3 = Color(hex: "#252733")

    // MARK: - Текст
    static let appText     = Color(hex: "#F0F1F5")
    static let appText2    = Color(hex: "#9395A5")
    static let appText3    = Color(hex: "#5A5C6E")

    // MARK: - Акценты
    static let appAccent   = Color(hex: "#6C8EFF")
    static let appAccent2  = Color(hex: "#A78BFA")

    // MARK: - Семантические
    static let appGreen    = Color(hex: "#34D399")
    static let appRed      = Color(hex: "#F87171")
    static let appOrange   = Color(hex: "#FB923C")
    static let appYellow   = Color(hex: "#FBBF24")
}
