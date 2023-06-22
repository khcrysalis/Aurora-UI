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
    
    @State private var showToast = isSimulator()
    
    
    var body: some View {
        ZStack {
            // Animated Background
            ZStack {
                
                Blur(style: .systemChromeMaterialDark)
                    .edgesIgnoringSafeArea(.all)
                
                // Other Views
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
                                .frame(width: UIScreen.main.bounds.width)
                                .tag(Tabs.options)
                            Main(isTabViewShown: $isTabViewShown)
                                .frame(width: UIScreen.main.bounds.width)
                                .tag(Tabs.main)
                            Credits()
                                .frame(width: UIScreen.main.bounds.width)
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
        .toast(isPresenting: $showToast){
            AlertToast(displayMode: .banner(.pop), type: .systemImage("exclamationmark.triangle.fill", Color(UIColor.label).opacity(0.4)), title: "AORAInteractor is in Demo Mode", subTitle: "This will not actually jailbreak your device.")
        }
        
    }
    
    enum Tabs {
        case options
        case main
        case credits
    }
}
