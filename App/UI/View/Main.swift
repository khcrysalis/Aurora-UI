//
//  Main.swift
//  rambutan
//
//  Created by samara on 6/15/23.
//

import SwiftUI
import MachO

struct Main: View {
    @ObservedObject var options = Settings.shared
    @Binding var isTabViewShown: Bool
    
    let f = UINotificationFeedbackGenerator()
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "house.fill")
                .resizable()
                .frame(width: 37, height: 32)
                .foregroundColor(.white.opacity(0.2))
                .shadow(color: Color.black.opacity(0.1), radius: 10)
            
            Spacer()
            
            Text("\(DeviceInfo.current.machineName) running \(DeviceInfo.current.platformName) \(DeviceInfo.current.platformVer)")
                .foregroundColor(.white.opacity(0.4))
                .font(.subheadline)
            
            .padding()
            
            Section() {
                VStack(spacing: 10) {
                    Toggle("Tweaks", isOn: $options.isTweaksEnabled)
                        .foregroundColor(Color(UIColor.label))
                        .padding(.horizontal, 10)
                    Divider()
                    Toggle("Restore RootFS", isOn: $options.isRestoreRootfsEnabled)
                        .foregroundColor(Color(UIColor.label))
                        .padding(.horizontal, 10)
                }
                .padding()
                .background(Blur(style: .systemThinMaterial))
                .cornerRadius(26)
                .padding(.bottom, 5)
            }
            
            createButton(text: Validation.compatibilityCheck() ? (options.isRestoreRootfsEnabled ? "Restore Filesystem" : "Jailbreak") : "Unsupported", action: {
                f.notificationOccurred(.success)
                withAnimation {
                    isTabViewShown = false
                }
            })
            
        }
        .padding()
        .padding(.bottom, 30)
        .transition(.opacity)
    }
}

