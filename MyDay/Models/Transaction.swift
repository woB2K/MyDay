//
//  Transaction.swift
//  MyDay
//
//  Created by Maxim Vershinin on 16.04.2026.
//

import SwiftData
import Foundation

@Model
final class Transaction: Base {
    var amount: Decimal = 0
    var currency: String = "RUB"
    var type: TransactionType = TransactionType.expense
    var category: Category? = nil
    var note: String? = nil
    var date: Date = Date()
    
    override init() {}
}

enum TransactionType: String, Codable {
    case income, expense
}
