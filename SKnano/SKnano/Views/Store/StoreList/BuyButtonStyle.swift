//
//  BuyButtonStyle.swift
//  SKnano
//
//  Created by Eduardo on 09/11/23.
//

import StoreKit
import SwiftUI

struct BuyButtonStyle: ButtonStyle {
    let isPurchased: Bool
    
    init(isPurchased: Bool = false) {
        self.isPurchased = isPurchased
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        var bgColor: Color = isPurchased ? Color.green : Color.blueBuy
        bgColor = configuration.isPressed ? bgColor.opacity(0.7) : bgColor.opacity(1)
        
        return configuration.label
            .frame(width: 60)
            .padding(10)
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct BuyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button(action: {}) {
                Text("Buy")
                    .foregroundColor(.goldPrice)
                    .bold()
            }
            .buttonStyle(BuyButtonStyle())
            .previewDisplayName("Normal")
            
            Button(action: {}) {
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
            }
            .buttonStyle(BuyButtonStyle(isPurchased: true))
            .previewDisplayName("Purchased")
        }
    }
}

