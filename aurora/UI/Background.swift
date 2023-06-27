//
//  BallView.swift
//  rambutan
//
//  Created by samara on 6/15/23.
//

import SwiftUI

struct Background: View {
    @ObservedObject var options = Settings.shared
    @State private var animation = false
     
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<3) { _ in
                    createImage(geometry)
                }
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        
    }
    
    private func createImage(_ geometry: GeometryProxy) -> some View {
        let randomWidth = randomFrame(geometry.size.width)
        let randomHeight = randomFrame(geometry.size.width)
        let scale = randomCGFloat(in: 1...2.5)
        let offsetX = randomCGFloat(in: -300...300)
        let offsetY = randomCGFloat(in: -300...300)
        let rotation = randomDouble(in: -360...360)
        let saturation = randomDouble(in: 0.4...1.4)
        
        return Image(Settings().selectedThemeImage)
            .resizable()
            .frame(width: randomWidth, height: randomHeight)
            .scaleEffect(scale)
            .opacity(0.5)
            .rotationEffect(.degrees(rotation), anchor: .center)
            .offset(x: offsetX, y: offsetY)
            .blendMode(.lighten)
            .saturation(saturation)
            .contrast(2)
    }
    
    private func randomFrame(_ base: CGFloat) -> CGFloat {
        let randomNumber = animation ? CGFloat.random(in: -100...300) : CGFloat.random(in: -100...300)
        return base + randomNumber
    }
    
    private func randomCGFloat(in range: ClosedRange<CGFloat>) -> CGFloat {
        let randomNumber = animation ? CGFloat.random(in: range) : CGFloat.random(in: range)
        return randomNumber
    }
    
    private func randomDouble(in range: ClosedRange<Double>) -> Double {
        let randomNumber = animation ? Double.random(in: range) : Double.random(in: range)
        return randomNumber
    }
}

