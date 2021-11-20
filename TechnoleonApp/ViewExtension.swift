//
//  ViewExtension.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/20/21.
//

import Foundation
import SwiftUI

extension View {
    
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
    
}
