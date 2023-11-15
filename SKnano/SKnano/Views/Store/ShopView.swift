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
        ZStack {
            Color.customBackground
                .ignoresSafeArea()
            ScrollView {
                ForEach(store.skins) { skin in
                    ListCellView(product: skin)
                        .padding(.leading, 10)
                        .padding(.trailing, 15)
                    Divider()
                        .background(Color.goldText)
                }
                
                .listStyle(GroupedListStyle())
                
                    ForEach(store.nonRenewables) { product in
                        ListSubView(product: product, purchasingEnabled: store.purchasedSubscriptions.isEmpty)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)

                    }
                
            }
            .navigationTitle("Store")
            .setNavbarTitleColor(.goldText)
            .environmentObject(store)
        }
    }
}

#Preview {
    @StateObject var store = Store()
    
    let view = NavigationStack {
        ShopView()
    }
    
    return view
}
