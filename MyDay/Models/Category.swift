//
//  Category.swift
//  MyDay
//
//  Created by Maxim Vershinin on 16.04.2026.
//

import SwiftData
import Foundation

@Model
final class Category: Base {
    var name: String = ""
    var icon: String = "questionmark"
    var colorHex: String = "#6C8EFF"
    var type: TransactionType = TransactionType.expense
    var isDefault: Bool = false
    
    override init() {}
}
