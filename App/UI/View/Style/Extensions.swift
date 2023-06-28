//
//  Extensions.swift
//  Aurora
//
//  Created by samara on 6/28/23.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

extension View {
    func applyLinearGradientMask() -> some View {
        let topToBottomGradient = LinearGradient(
            gradient: Gradient(colors: [.black, .black, .black, .black, .clear]),
            startPoint: .top,
            endPoint: .bottom
        ).padding(.bottom, 30)
        
        let bottomToTopGradient = LinearGradient(
            gradient: Gradient(colors: [.black, .black, .black, .black, .clear]),
            startPoint: .bottom,
            endPoint: .top
        ).padding(.vertical, 10)
        
        return self
            .mask(topToBottomGradient)
            .mask(bottomToTopGradient)
    }
}
