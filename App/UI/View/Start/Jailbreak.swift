//
//  Jailbreak.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI
import UIKit
import SwiftUIBackports

struct Jailbreak: View {
    @State private var shadowScale: CGFloat = 1.0
    @State private var showRebootView = false
    @State private var logDrawerOpen = false
    
    @ObservedObject var console = Console.shared
    
    var body: some View {
        ZStack {
            if showRebootView {
                Reboot()
                    .frame(maxWidth: 375)
                    .transition(.opacity)
            } else {
                VStack {
                    HStack {
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 37, height: 32)
                            .foregroundColor(.white.opacity(0.2))
                            .shadow(color: Color.black.opacity(0.1), radius: 10)
                            .modifier(PulsatingShadow(scale: shadowScale))
                            .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                    }
                    
                    Spacer()
                    
                    ScrollView(showsIndicators: false) {
                        ScrollViewReader { scrollView in
                            VStack {
                                Spacer()
                                
                                ForEach(console.logs.reversed()) { log in
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(log.message)
                                                .foregroundColor(.white)
                                                .font(.headline)
                                                .padding(.leading, 20)
                                        }
                                        Spacer()
                                    }
                                    .padding(.vertical, 3)
                                }
                            }
                            .onChange(of: console.logs) { _ in
                                scrollView.scrollTo(console.logs.last?.id, anchor: .bottom)
                            }
                        }
                    }
                    .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear]), startPoint: .bottom, endPoint: .top))
                    .opacity(logDrawerOpen ? 1 : 0).transition(.opacity)
                    Spacer()
                    VStack{
                        HStack {
                            VStack(alignment: .leading) {
                                Text(console.line1?.message ?? "")
                                    .foregroundColor(Color(UIColor.label))
                                    .font(.headline)
                                    .padding(.leading, 20)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Blur(style: .systemThinMaterial))
                        .foregroundColor(.white)
                        .cornerRadius(26)
                        .padding(.bottom, 5)
                        .shadow(color: Color.black.opacity(0.1), radius: 10)
                    }
                    
                    HStack {
                        VStack {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .frame(width: 8, height: 8)
                                    .foregroundColor(Color(UIColor.label).opacity(0.4))
                                Text("View Logs")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(UIColor.label).opacity(0.4))
                            }
                            .padding(.horizontal, 8)
                            .padding(.vertical, 5)
                            .background(Blur(style: .systemThinMaterial))
                            .foregroundColor(.black)
                            .cornerRadius(26)
                            .onTapGesture {
                                self.logDrawerOpen.toggle()
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            animateShadow()
            DispatchQueue(label: "Exploit").async {
                launchExampleExploit()
            }
        }
    }
    
    private func animateShadow() {
        withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            shadowScale = 1.3
        }
    }
    
    func launchExampleExploit() {
        console.log("Obtaining system privileges...")
        sleep(1)
        console.log("Exploiting...")
        sleep(1)
        console.log("Installing Strap...")
        sleep(1)
        console.log("Installing Strap...")
        sleep(1)
        console.log("Installing Strap...")
        sleep(1)
        console.log("Installing Strap...")
        sleep(1)
        console.log("Installing Strap...")
        sleep(1)
        
        console.log("Cleaning up...")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                showRebootView = true
//              }
    }
}


struct PulsatingShadow: ViewModifier {
    let scale: CGFloat
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.white.opacity(0.8), radius: 10 * scale)
            .scaleEffect(scale)
    }
}


struct RemoveBG: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        class SuperviewClear: UIView {
            //        override func layoutSubviews() {
            //          guard let parentView = superview?.superview else { return }
            //          parentView.backgroundColor = .clear
            //        }
            override func didMoveToWindow() {
                guard let parentView = superview?.superview else { return }
                parentView.backgroundColor = .clear
            }
        }
        let view = SuperviewClear()
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
