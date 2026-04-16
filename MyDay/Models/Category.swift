//
//  Category.swift
//  MyDay
//
//  Created by Maxim Vershinin on 16.04.2026.
//

import SwiftData
import Foundation

@Model
final class Category {
    var uid: UUID = UUID()
    var createTime: Date = Date()
    var updateTime: Date = Date()
    var name: String = ""
    var icon: String = "questionmark"
    var colorHex: String = "#6C8EFF"
    var type: TransactionType = TransactionType.expense
    var isDefault: Bool = false
    
    init() {}
}
