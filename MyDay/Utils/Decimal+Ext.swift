//
//  Decimal+Ext.swift
//  MyDay
//
//  Created by Maxim Vershinin on 05.05.2026.
//

import Foundation

extension Decimal {
    func formatted() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.groupingSeparator = " "
        
        let result = formatter.string(from: self as NSDecimalNumber) ?? "0"
        
        return result + " ₽"
    }
}
