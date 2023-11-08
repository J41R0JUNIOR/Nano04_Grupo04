//
//  Title.swift
//  SKnano
//
//  Created by Eduardo on 08/11/23.
//

import Foundation
import SwiftUI

extension View {
    func setNavbarColor(_ color: Color) -> some View {
        return self.onAppear {
            UINavigationBar.appearance().barTintColor = UIColor(color)
        }
    }
    
    func setNavbarTitleColor(_ color: Color) -> some View {
        return self.onAppear {
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(color)]
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(color)]
        }
    }
    
    
}

