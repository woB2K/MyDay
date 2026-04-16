//
//  Transaction.swift
//  MyDay
//
//  Created by Maxim Vershinin on 16.04.2026.
//

import SwiftData
import Foundation

@Model
final class Transaction {
    var uid: UUID = UUID()
    var createTime: Date = Date()
    var updateTime: Date = Date()
    var amount: Decimal = 0
    var currency: String = "RUB"
    var type: TransactionType = TransactionType.expense
    var category: Category? = nil
    var note: String? = nil
    var date: Date = Date()
    
    init() {}
}

enum TransactionType: String, Codable {
    case income, expense
}
