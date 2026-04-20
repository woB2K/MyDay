//
//  TaskTag.swift
//  MyDay
//
//  Created by Maxim Vershinin on 20.04.2026.
//

import SwiftData
import Foundation

@Model
final class TaskTag {
    var uid: UUID = UUID()
    var createTime: Date = Date()
    var updateTime: Date = Date()
    var title: String = ""
    var colorHex: String = ""
    var tasks: [Task] = []
    
    init() {}
}
