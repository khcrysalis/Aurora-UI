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
    @State private var selectedTab: Tabs = .main
    @State private var blurOpacity: Double = 0.7
    
    var body: some View {
        ZStack {
            ZStack {
                Blur(style: .systemChromeMaterialDark)
                    .edgesIgnoringSafeArea(.all)

                if !isTabViewShown {
                    LinearGradient(colors: [Color.black], startPoint: .leading, endPoint: .trailing)
                        .ignoresSafeArea()
                        .opacity(0.5)
                }
                
                ZStack {
                    if selectedTab != .main {
                        Blur(style: .systemChromeMaterialDark)
                            .ignoresSafeArea()
                            .opacity(blurOpacity)
                    }
                    
                    // Content Views
                    if isTabViewShown {
                        TabView(selection: $selectedTab) {
                            Options()
                                .tag(Tabs.options)
                                .frame(maxWidth: 375)
                            Main(isTabViewShown: $isTabViewShown)
                                .frame(maxWidth: 375)
                                .tag(Tabs.main)
                            Credits()
                                .frame(maxWidth: 375)
                                .tag(Tabs.credits)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                    } else {
                        Jailbreak()
                            .frame(width: UIScreen.main.bounds.width)
                    }
                }
                .animation(.easeOut(duration: 0.4))
            }
        }
        .animation(.easeOut(duration: 0.4))
        .background(Background().animation(.easeInOut(duration: 3.0)))
        .ignoresSafeArea(.keyboard)
    }
    
    enum Tabs {
        case options
        case main
        case credits
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
