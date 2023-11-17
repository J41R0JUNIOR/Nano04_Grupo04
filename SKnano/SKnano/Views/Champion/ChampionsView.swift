//
//  ChampionsDetailsView.swift
//  SKnano
//
//  Created by Eduardo on 09/11/23.
//

import SwiftUI

struct ChampionsView: View {
    var body: some View {
        ZStack {
            Color.customBackground
                .ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 0) {
                    ListRowView(name: "Jinx", title: "", image: "Jinx")
                    ListRowView(name: "Riven", title: "", image: "Riven")
                    ListRowView(name: "Sylas", title: "", image: "Sylas")
                }
                .padding()
            }
        }
        .navigationTitle("Champions")
        .setNavbarTitleColor(.goldText)
    }
}

#Preview {
    NavigationStack {
        ChampionsView()
    }
}
