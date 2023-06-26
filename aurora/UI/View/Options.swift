//
//  DetailView.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI

struct Options: View {
    @ObservedObject var options = Settings.shared
    @State var textFieldInput: String = ""
    @State private var showToast = false
    @State private var isShowingInvalidToast = false
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            
            Section(header: CustomSectionHeader(title: "Customization")) {
                VStack(spacing: 10) {
                    ForEach(Theme.appThemes, id: \.name) { theme in
                        Button {
                            options.selectedTheme = theme.name
                            options.selectedThemeImage = theme.image
                        } label: {
                            HStack {
                                Text(theme.name)
                                Spacer()
                                if options.selectedTheme == theme.name {
                                    Image(systemName: "checkmark.circle.fill")
                                }
                            }
                        }
                        .foregroundColor(Color(UIColor.label))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if theme != Theme.appThemes.last {
                            Divider()
                        }
                    }
                }
                .padding()
                .background(Blur(style: .systemThinMaterial))
                .foregroundColor(.white)
                .cornerRadius(26)
                .padding(.bottom, 5)
            }
            
            Section(header: CustomSectionHeader(title: "Settings")) {
                VStack(spacing: 10) {
                        Toggle("Show More Logs", isOn: $options.isLogsEnabled)
                            .foregroundColor(Color(UIColor.label))
                            .padding(.leading, 10)
                    Divider()
                    HStack {
                        TextField("0x3bc2b1fbd8d0f821", text: $textFieldInput)
                            .padding(.leading, 10)
                            .ignoresSafeArea()
                        
                        Button(action: {
                            let regex = try! NSRegularExpression(pattern: "^0x[a-fA-F0-9]{16}$")
                            let range = NSRange(location: 0, length: textFieldInput.utf16.count)
                            
                            if regex.firstMatch(in: textFieldInput, options: [], range: range) != nil {
                                options.textFieldText = textFieldInput
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
                VStack(spacing: 10) {
                    HStack {
                        createButton(text: "Respring", action: {
                            print("Respring tapped")
                        })
                        createButton(text: "UICache", action: {
                            print("UICache tapped")
                        })
                    }
                    createButton(text: "Userspace Reboot", action: {
                        print("Userspace Reboot tapped")
                    })
                }
            }
            
        }
        .padding()
        .padding(.bottom, 30)
        .toast(isPresenting: $showToast) {
            AlertToast(displayMode: .banner(.pop),
                       type: isShowingInvalidToast ?
                           .systemImage("exclamationmark.triangle.fill", Color(UIColor.label).opacity(0.4)) :
                           .systemImage("checkmark.circle.fill", Color(UIColor.label).opacity(0.4)),
                       title: isShowingInvalidToast ? "Error" : "Success",
                       subTitle: isShowingInvalidToast ?
                           "That doesn't look right. The generator should start with 0x and contain 16 digits/letters A to F." :
                           "The generator will be set every time you activate Aurora."
            )
        }
    }
}


