//
//  TaskPriority+Ext.swift
//  MyDay
//
//  Created by Maxim Vershinin on 20.04.2026.
//

import SwiftUI

extension TaskPriority {
    var color: Color {
        switch self {
        case .high:   return Color.appRed
        case .medium: return Color.appYellow
        case .low:    return Color.appGreen
        }
    }
    
    var label: String {
        switch self {
        case .high:   return "Высокий"
        case .medium: return "Средний"
        case .low:    return "Низкий"
        }
    }
}
