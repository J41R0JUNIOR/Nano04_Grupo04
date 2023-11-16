//
//  ContentView.swift
//  SKnano
//
//  Created by Eduardo on 06/11/23.
//

import SwiftUI

struct ContentView: View {
    
    let numeros = [1,2,3]
    @ObservedObject var vm = CloudKitVM()//Instantiate the class with cloud functions
    @StateObject var notification = PushNotificationCloudKit()
    
    var body: some View {
        ZStack {
            Color.customBackground
                .ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(numeros, id: \.self) { _ in
                        ListRowView(name: "Jinx", title: "O Gatilho desenfreado", image: "Jinx")
                    }
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
        ContentView()
    }
}
