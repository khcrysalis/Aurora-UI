//
//  DetailView.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI
import UIKit

struct Options: View {
    @ObservedObject var options = Settings.shared
    @State var textFieldInput: String = ""
    @State private var showToast = false
    @State private var isShowingInvalidToast = false
    
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

                        Section(header: CustomSectionHeader(title: "Settings")) {
                            VStack {
                                HStack {
                                    Spacer()
                                    VStack {
                                        Toggle("Show More Logs", isOn: $options.isLogsEnabled)
                                            .foregroundColor(Color(UIColor.label))
                                    }
                                    Spacer()
                                }
                                Divider()
                                
                                HStack {
                                    TextField("0x3bc2b1fbd8d0f821", text: $textFieldInput)
                                        .padding(.leading, 10)
                                    Button(action: {
                                        let regex = try! NSRegularExpression(pattern: "^0x[a-fA-F0-9]{16}$")
                                        let range = NSRange(location: 0, length: textFieldInput.utf16.count)
                                        
                                        if regex.firstMatch(in: textFieldInput, options: [], range: range) != nil {
                                            options.textFieldText = textFieldInput
                                            print("Input: \(textFieldInput)")
                                            print("Now: \(options.textFieldText)")
                                            showToast = true
                                            isShowingInvalidToast = false
                                        } else {
                                            textFieldInput = ""
                                            showToast = true
                                            isShowingInvalidToast = true
                                        }
                                    }) {
                                        Image(systemName: "pencil")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(Color(UIColor.label))
                                            .padding(.trailing, 10)
                                    }
                                }
                            }
                            .padding()
                            .background(Blur(style: .systemThinMaterial))
                            .cornerRadius(26)
                            .padding(.bottom, 5)
                        }


                        Section(header: CustomSectionHeader(title: "Utilities")) {
                            VStack {
                                HStack {
                                    createButton(text: "Respring", action: {
                                        print("Respring tapped")
                                    })
                                    createButton(text: "UICache", action: {
                                        print("UICache tapped")
                                    })
                                }
                                HStack {
                                    createButton(text: "Userspace Reboot", action: {
                                        print("Userspace Reboot tapped")
                                    })
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
        .toast(isPresenting: $showToast) { isShowingInvalidToast ?
            AlertToast(displayMode: .banner(.pop), type: .systemImage("exclamationmark.triangle.fill", Color(UIColor.label).opacity(0.4)), title: "Error", subTitle: "That doesn't look right. The generator should start with 0x, and contain 16 digits/letters A to F.") :
            AlertToast(displayMode: .banner(.pop), type: .systemImage("checkmark.circle.fill", Color(UIColor.label).opacity(0.4)), title: "Success", subTitle: "The generator will be set every time you activate Aurora.")
        }
    }
}

