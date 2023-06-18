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
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 37, height: 32)
                        .foregroundColor(Color(UIColor.label).opacity(0.4))
                        .shadow(color: Color.black.opacity(0.1), radius: 10)
                    VStack {
                        Text("Taurine jailbreak")
                            .foregroundColor(Color(UIColor.label).opacity(0.4))
                            .font(.headline)
                            .shadow(color: Color.black.opacity(0.1), radius: 10)
                        Text("for iOS 14.6 - 14.8")
                            .foregroundColor(Color(UIColor.label).opacity(0.4))
                            .font(.subheadline)
                            .shadow(color: Color.black.opacity(0.1), radius: 10)
                    }
                }
                Spacer()
                VStack {
                    Text("\(DeviceInfo.current.machineName) running \(DeviceInfo.current.platformName) \(DeviceInfo.current.version)")
                        .foregroundColor(Color(UIColor.label).opacity(0.4))
                        .font(.subheadline)
                }
                .padding()
                HStack {
                    VStack {
                        VStack {
                            createButton(text: Validation.compatCheck() ? "Jailbreak" : "Unsupported", action: {
                                isTabViewShown.toggle()
                                
                                DispatchQueue(label: "Taurine").async {
                                    Jailbreak().launchExampleExploit()
                                }
                            }, isDisabled: { !Validation.compatCheck() })
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
                .padding(10)
            }
            .padding()
            .transition(.opacity)
        }
    }
}



