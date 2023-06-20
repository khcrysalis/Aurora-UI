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
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 37, height: 32)
                        .foregroundColor(Color(UIColor.label).opacity(0.2))
                        .shadow(color: Color.black.opacity(0.1), radius: 10)
                }
                Spacer()
                VStack {
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
                }
                .padding()
                HStack {
                    VStack {
                        VStack {
                            createButton(text: Validation.compatibilityCheck() ? "Jailbreak" : "Unsupported", action: {
							  withAnimation {
								isTabViewShown.toggle()
							  }
                            }, isDisabled: { !Validation.isCompatible })
                        }
                        
                        VStack {
                            HStack {
                                Spacer()
                                VStack {
                                    Toggle("Tweaks", isOn: $options.isTweaksEnabled)
                                        .foregroundColor(Color(UIColor.label))
                                    Divider()
                                    Toggle("Restore RootFS", isOn: $options.isRestoreRootfsEnabled)
                                        .foregroundColor(Color(UIColor.label))
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Blur(style: .systemThinMaterial))
                            .cornerRadius(26)
                            .padding(.bottom, 5)
                        }
                        .padding(.bottom, 30)
                    }
                }
                .shadow(color: Color.black.opacity(0.1), radius: 10)
                .padding(.vertical, 10)
            }
            .padding()
            .transition(.opacity)
        }
    }
}
