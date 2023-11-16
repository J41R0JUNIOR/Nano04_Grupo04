//
//  ContentView.swift
//  SKnano
//
//  Created by Eduardo on 06/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = CloudKitVM()//Instantiate the class with cloud functions
    @StateObject var notification = PushNotificationCloudKit()//Instantiate the class with Notifications config
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
