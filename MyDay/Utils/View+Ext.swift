//
//  View+Ext.swift
//  MyDay
//
//  Created by Maxim Vershinin on 20.04.2026.
//

import SwiftUI

extension View {
    func inputField() -> some View {
        self
            .foregroundStyle(Color.appText)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.appSurface2)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.appText.opacity(0.3), lineWidth: 1.5)
            )
            .cornerRadius(16)
    }
    
    func primaryButton() -> some View {
        self
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.appAccent)
            .foregroundStyle(Color.appText).bold()
            .cornerRadius(16)
            .shadow(color: Color.appAccent.opacity(0.4), radius: 12, y: 6)
    }
}
