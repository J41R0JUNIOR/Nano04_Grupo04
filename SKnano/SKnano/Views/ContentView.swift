//
//  ContentView.swift
//  SKnano
//
//  Created by Eduardo on 06/11/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = CloudKitVM()//Instantiate the class with cloud functions
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
