//
//  FinanceViewModel.swift
//  MyDay
//
//  Created by Maxim Vershinin on 05.05.2026.
//

import SwiftData
import Foundation

@Observable
class FinanceViewModel {
    private var modelContext: ModelContext
    var transactions: [Transaction] = []
    var totalIncome: Decimal {
        transactions
            .filter { $0.type == .income }
            .reduce(Decimal(0)) { $0 + $1.amount }
    }
    
    var totalExpense: Decimal {
        transactions
            .filter { $0.type == .expense }
            .reduce(Decimal(0)) { $0 + $1.amount }
    }
    
    var balance: Decimal {
        totalIncome - totalExpense
    }
    
    init(context: ModelContext) {
        self.modelContext = context
        loadTransactions()
    }
    
    // Более "чистая" логика делать именно через @Query для "живой подписки" на БДшку
    // в таком подходе приходится вызывать loadTransaction каждый раз при любой CRUD операции
    func loadTransactions() {
        self.transactions = (try? modelContext.fetch(FetchDescriptor<Transaction>())) ?? []
    }
}
