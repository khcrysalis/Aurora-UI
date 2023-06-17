//
//  ContentView.swift
//  rambutan
//
//  Created by samara on 6/15/23.
//

import SwiftUI

struct ContentView: View {
    @State var isTabViewShown = true
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTab = 1
    @State private var blurOpacity: Double = 0.7
    
    var body: some View {
        ZStack {
            Image("marek-piwnicki-i0ssRdozgCQ-unsplash")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.vertical)
            
            Blur(style: .systemMaterial)
                .ignoresSafeArea()
                .opacity(0.4)
                .blur(radius: 100)
            
            if !isTabViewShown {
                Blur(style: .systemThickMaterialDark)
                    .ignoresSafeArea()
                    .opacity(0.7)
            }
            
            ZStack {
                if selectedTab != 1 {
                    Blur(style: .systemUltraThinMaterialDark)
                        .ignoresSafeArea()
                        .opacity(blurOpacity)
                }
            }
            .animation(.easeOut(duration: 0.4))
            
            if isTabViewShown {
                TabView(selection: $selectedTab) {
                    Options()
                        .frame(width: UIScreen.main.bounds.width)
                        .tag(0)
                    Main(isTabViewShown: $isTabViewShown)
                        .frame(width: UIScreen.main.bounds.width)
                        .tag(1)
                    Credits()
                        .frame(width: UIScreen.main.bounds.width)
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .opacity(blurOpacity)
            } else {
                Jailbreak()
                    .frame(width: UIScreen.main.bounds.width)
            }
        }
        .animation(.easeOut(duration: 0.4))
    }
}

