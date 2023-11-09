//
//  ContentView.swift
//  SKnano
//
//  Created by Eduardo on 06/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                ChampionsView()
            }
            .tabItem {
                Label("Champions", systemImage: "list.dash")
            }
            NavigationStack {
                ShopView()
            }
            .tabItem {
                Label("Store", systemImage: "square.and.pencil")
            }
        }
    }
}

#Preview {
    ContentView()
}
