//
//  Base.swift
//  MyDay
//
//  Created by Maxim Vershinin on 16.04.2026.
//

import SwiftData
import Foundation

@Model
class Base {
    var uid: UUID = UUID()
    var createTime: Date = Date()
    var updateTime: Date = Date()
    
    init() {}
}
