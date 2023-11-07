//
//  ListComponent.swift
//  SKnano
//
//  Created by Eduardo on 07/11/23.
//

import SwiftUI

struct ListComponent: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(Color.CustomRadialGradient)
                .background {
                    HStack {
                        Text("Riven")
                            .font(Font.custom("BeaufortforLOL-BoldItalic", size: 40))
                            .foregroundStyle(.white)
                        Image("RivenSentinela")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .scaledToFit()
                    }
                }
                .frame(maxHeight: 150)
                .padding()
            
        }
    }
}

#Preview {
    ListComponent()
        .previewLayout(.sizeThatFits)
}
