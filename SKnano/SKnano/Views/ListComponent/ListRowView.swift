//
//  ListComponent.swift
//  SKnano
//
//  Created by Eduardo on 07/11/23.
//

import SwiftUI

struct ListRowView: View {
    
    @State var name: String
    @State var title: String
    @State var image: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .background {
                    HStack {
                        Spacer()
                        Image(image)
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .scaledToFit()
                    }
                }
                .foregroundStyle(Color.customRadialGradient)
                .frame(height: 150)
                .shadow(radius: 16)
                .padding(.bottom)
            HStack {
                VStack {
                    Text(name)
                        .font(Font.custom("BeaufortforLOL-BoldItalic", size: 38))
                        .foregroundStyle(.goldText)
                    Text(title)
                        .font(Font.custom("BeaufortforLOL-Medium", size: 16))
                        .foregroundStyle(.goldText)
                }
                .padding(.leading)
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16)
                    .padding(.trailing, 25)
                    .foregroundStyle(Color.goldText)
            }
        }
    }
}

#Preview {
    ListRowView(name: "Riven", title: "A Exilada", image: "RivenSentinela")
        .previewLayout(.sizeThatFits)
}
