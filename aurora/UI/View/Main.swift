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
    @State private var showAlert = false
    @State private var showToast = false
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "house.fill")
                .resizable()
                .frame(width: 37, height: 32)
                .foregroundColor(Color(UIColor.label).opacity(0.2))
                .shadow(color: Color.black.opacity(0.1), radius: 10)
            
            Spacer()
            
            Button(action: {
                showAlert = true
            }) {
                HStack {
                    Image(systemName: "info.circle")
                        .foregroundColor(Color(UIColor.label).opacity(0.4))
                    
                    Text("\(DeviceInfo.current.machineName) running \(DeviceInfo.current.platformName) \(DeviceInfo.current.platformVer)")
                        .foregroundColor(Color(UIColor.label).opacity(0.4))
                        .font(.subheadline)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Supported Firmwares"),
                    message: Text("iOS 14.6 - 14.8"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .padding()
            
            createButton(text: Validation.compatibilityCheck() ? (options.isRestoreRootfsEnabled ? "Restore Filesystem" : "Jailbreak") : "Unsupported", action: {
                withAnimation {
                    isTabViewShown = false
                }
            })
            
            VStack {
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
        .padding()
        .padding(.bottom, 30)
        .shadow(color: Color.black.opacity(0.1), radius: 10)
        .transition(.opacity)
        .toast(isPresenting: $showToast) {
            AlertToast(displayMode: .banner(.pop), type: .systemImage("exclamationmark.triangle.fill", Color(UIColor.label).opacity(0.4)), title: "AORAInteractor is in Demo Mode", subTitle: "This will not actually jailbreak your device.")
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if isSimulator() {
                    showToast = true
                }
            }
        }
    }
}

