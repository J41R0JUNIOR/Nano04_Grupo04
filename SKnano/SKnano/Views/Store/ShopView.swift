//
//  StoreView.swift
//  SKnano
//
//  Created by Eduardo on 09/11/23.
//

import SwiftUI
import StoreKit

struct ShopView: View {
    @StateObject var store: Store = Store()

    var body: some View {
        List {
            Section("Cars") {
                ForEach(store.skins) { skin in
                    ListCellView(product: skin)
                }
            }
            .listStyle(GroupedListStyle())


            Section("Navigation: Non-Renewing Subscription") {
                ForEach(store.nonRenewables) { product in
                    ListCellView(product: product, purchasingEnabled: store.purchasedSubscriptions.isEmpty)
                }
            }
            .listStyle(GroupedListStyle())

            Button("Restore Purchases", action: {
                Task {
                    //This call displays a system prompt that asks users to authenticate with their App Store credentials.
                    //Call this function only in response to an explicit user action, such as tapping a button.
                    try? await AppStore.sync()
                }
            })

        }

        .navigationTitle("Store")
        .setNavbarTitleColor(.goldText)
        .environmentObject(store)
    }
}

#Preview {
    @StateObject var store = Store()
    
    let view = NavigationStack {
        ShopView()
    }
    
    return view
}
