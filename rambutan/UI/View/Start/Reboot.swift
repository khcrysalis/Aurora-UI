//
//  Reboot.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI

struct Reboot: View {
    @State private var showText = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 64, height: 53)
                    .foregroundColor(.white)
                    .opacity(showText ? 1 : 0)
                    .animation(.easeIn(duration: 0.5))
                Spacer()
                Text("iPhone will restart automatically")
                    .font(.bold(.headline)())
                    .foregroundColor(.white)
                    .opacity(showText ? 1 : 0)
                    .animation(.easeIn(duration: 0.5))
            }
            .padding(.bottom, 100)
        }
        .statusBar(hidden: true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                print("Some reboot function probably")
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    showText = true
                }
            }
        }
    }
}



