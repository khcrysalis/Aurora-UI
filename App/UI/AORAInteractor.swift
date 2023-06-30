//
//  ContentView.swift
//  rambutan
//
//  Created by samara on 6/15/23.
//

import SwiftUI

//MARK: - AORAInteractor
struct ContentView: View {
    @State private var isTabViewShown = true
    @Environment(\.colorScheme) private var colorScheme
    @State private var selectedTab: Tabs = .main
    @State private var blurOpacity: Double = 0.7
    @StateObject var toastState = ToastState()

    var body: some View {
        ZStack {
            if !isTabViewShown {
                Color.black
                    .ignoresSafeArea()
                    .opacity(0.3)
            }
            
            ZStack {
                if selectedTab != .main {
                    Color.black
                        .ignoresSafeArea()
                        .opacity(0.4)
                }
                
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
                    .environmentObject(toastState)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                } else {
                    Jailbreak()
                        .frame(maxWidth: .infinity)
                }
            }
            .animation(.easeOut(duration: 0.4))
            
        }
        .animation(.easeOut(duration: 0.4))
        .background(
            ZStack {
                Background()
                    .animation(.easeInOut(duration: 3.0))
                
                Blur(style: .systemChromeMaterialDark)
                    .edgesIgnoringSafeArea(.all)
            }
        )
        .toast(isPresenting: $toastState.showToast) {
            toastState.activeToast?.toast ?? defaultToast()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if isSimulator() {
                    toastState.show(toast: .demoMode)
                }
            }
        }
        .ignoresSafeArea(.keyboard)
    }
    
    enum Tabs {
        case options
        case main
        case credits
    }
}
