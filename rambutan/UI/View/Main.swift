//
//  Main.swift
//  rambutan
//
//  Created by samara on 6/15/23.
//

import SwiftUI
import MachO

struct Main: View {
    @Binding var isTabViewShown: Bool
    let version = UIDevice.current.systemVersion
    let arch = String(cString: NXGetLocalArchInfo().pointee.name)
    
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
                        Text("for iOS 14.0 - 14.8")
                            .foregroundColor(Color(UIColor.label).opacity(0.4))
                            .font(.subheadline)
                            .shadow(color: Color.black.opacity(0.1), radius: 10)
                    }
                }
                Spacer()
                VStack {
                    Text("Device on \(version) (\(arch))")
                        .foregroundColor(Color(UIColor.label).opacity(0.4))
                        .font(.subheadline)
                }
                .padding()
                HStack {
                    VStack {
                        VStack {
                            createButton(text: "Jailbreak") {
                                isTabViewShown.toggle()
                            }
                        }
                        
                        VStack {
                            HStack {
                                Spacer()
                                VStack {
                                    Toggle("Tweaks", isOn: .constant(true))
                                        .foregroundColor(Color(UIColor.label))
                                    Divider()
                                    Toggle("Restore RootFS", isOn: .constant(false))
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



