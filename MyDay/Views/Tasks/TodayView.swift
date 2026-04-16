//
//  TodayView.swift
//  MyDay
//
//  Created by Maxim Vershinin on 16.04.2026.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Today is a good day")
            }
            .padding(.horizontal, 20)
        }
        .background(Color.appOrange)
    }
}

#Preview {
    TodayView()
}
