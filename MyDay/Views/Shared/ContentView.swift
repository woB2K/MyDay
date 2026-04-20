//
//  ContentView.swift
//  MyDay
//
//  Created by Maxim Vershinin on 20.04.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TasksRootView()
                .tabItem { Label("Задачи", systemImage: "checklist") }
        }
        .toolbarBackground(Color.appBg, for: .tabBar)
    }
}
