//
//  DetailView.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI
import UIKit
import PhotosUI

struct Options: View {
    @ObservedObject var options = Settings.shared
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    VStack {
                        Section(header: CustomSectionHeader(title: "Customization")) {
                            VStack {
                                ForEach(Array(Theme.appThemes.enumerated()), id: \.element) { index, theme in
                                    Button {
                                        Settings().selectedTheme = theme.name
                                        Settings().selectedThemeImage = theme.image
                                    } label: {
                                        HStack(alignment: .center) {
                                            Text(theme.name)
                                            Spacer()
                                            if Settings().selectedTheme == theme.name {
                                                Image(systemName: "checkmark.circle.fill")
                                            }
                                        }
                                    }
                                    .foregroundColor(Color(UIColor.label))
                                    if index != Theme.appThemes.count - 1 {
                                        Divider()
                                    }
                                }
                            }
                            .padding(.leading, 10)
                            .padding()
                            .background(Blur(style: .systemThinMaterial))
                            .foregroundColor(.white)
                            .cornerRadius(26)
                            .padding(.bottom, 5)
                        }


                        
                        
                        
                        Section(header:
                                    CustomSectionHeader(title: "Settings")
                        ) {
                            VStack {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Toggle("Show More Logs", isOn: $options.isLogsEnabled)
                                            .foregroundColor(Color(UIColor.label))
                                        Divider()
                                        Toggle("iOS OTA Updates", isOn: $options.isOTAEnabled)
                                            .foregroundColor(Color(UIColor.label))
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(Blur(style: .systemThinMaterial))
                                .cornerRadius(26)
                                .padding(.bottom, 5)
                            }
                        }
                        
                        Section(header:
                                    CustomSectionHeader(title: "Utilities")
                        ) {
                            VStack {
                                HStack {
                                    createButton(text: "Respring", action: {
                                        print("Respring tapped")
                                    }, isDisabled: { !Validation.isCompatible })
                                    createButton(text: "UICache", action: {
                                        print("UICache tapped")
                                    }, isDisabled: { !Validation.isCompatible })
                                }
                                HStack {
                                    createButton(text: "Userspace Reboot", action: {
                                        print("Userspace Reboot tapped")
                                    }, isDisabled: { !Validation.isCompatible })
                                }
                            }
                        }
                    }
                }
                .shadow(color: Color.black.opacity(0.1), radius: 10)
                .padding(.vertical, 10)
                .padding(.bottom, 30)
            }
            .padding()
        }
        
    }
}
