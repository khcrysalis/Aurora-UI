//
//  Credits.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI
import URLImage

let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
let appName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String

struct Credits: View {
    @State private var showAlert = false
    let dayString = qOTD()
    var body: some View {
        VStack(spacing: 10) {
            ScrollView(showsIndicators: false) {
                Spacer()
                    .frame(height: 120)
                
                Section(header: CustomSectionHeader(title: "Acknowledgements")) {
                    createButtonWithImage(imageURL: URL(string: "https://github.com/mineek.png")!, buttonText: "mineek", subtext: "Developer", linkURL: URL(string: "https://github.com/mineek")!)
                    createButtonWithImage(imageURL: URL(string: "https://github.com/samiiau.png")!, buttonText: "samiiau", subtext: "UI & Design", linkURL: URL(string: "https://github.com/samiiau")!)
                    createButtonWithImage(imageURL: URL(string: "https://github.com/llsc12.png")!, buttonText: "Lakhan Lothiyi", subtext: "UI & App help", linkURL: URL(string: "https://github.com/llsc12")!)
                    createButtonWithImage(imageURL: URL(string: "https://github.com/staturnzz.png")!, buttonText: "Staturnz", subtext: "App help", linkURL: URL(string: "https://github.com/staturnzz")!)
                    createButtonWithImage(imageURL: URL(string: "https://github.com/potmdehex.png")!, buttonText: "John Aakerblom", subtext: "Multicast Bytecopy Backport", linkURL: URL(string: "https://twitter.com/potmdehex")!)
                    createButtonWithImage(imageURL: URL(string: "https://github.com/opa334.png")!, buttonText: "opa334", subtext: "Dopamine jailbreakd", linkURL: URL(string: "https://twitter.com/opa334dev")!)
                }
                
                Section(header: CustomSectionHeader(title: "Licensing")) {
                    createLButton(text: "SwiftUIBackports", subtext: "MIT License", action: {
                        openURL("https://github.com/shaps80/SwiftUIBackports")
                    }, infoaction: {
                        openURL("https://github.com/shaps80/SwiftUIBackports/blob/main/LICENSE.md")
                    })
                    
                    createLButton(text: "AlertToast", subtext: "MIT License", action: {
                        openURL("https://github.com/elai950/AlertToast")
                    }, infoaction: {
                        openURL("https://github.com/elai950/AlertToast/blob/master/LICENSE.md")
                    })
                    
                    createLButton(text: "SDWebImageSwiftUI", subtext: "MIT License", action: {
                        openURL("https://github.com/SDWebImage/SDWebImageSwiftUI")
                    }, infoaction: {
                        openURL("https://github.com/SDWebImage/SDWebImageSwiftUI/blob/master/LICENSE")
                    })
                }
                
                Section(header: CustomSectionHeader(title: "About")) {
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName: "house.fill")
                                .resizable()
                                .frame(width: 37, height: 32)
                                .foregroundColor(.white.opacity(0.2))
                                .shadow(color: Color.black.opacity(0.1), radius: 10)
                            VStack(alignment: .leading) {
                                
//                                Text(LocalizedStringKey("\(appName ?? "") "))
//                                    .foregroundColor(.white.opacity(0.4))
//                                    .font(.subheadline)
//                                    .bold() +
//                                Text("jailbreak")
//                                    .foregroundColor(.white.opacity(0.4))
//                                    .font(.subheadline)
                                
                                Text(LocalizedStringKey("\(appName ?? "") "))
                                    .foregroundColor(.white.opacity(0.4))
                                    .font(.subheadline)
                                    .bold() +
                                Text("build \(appVersion ?? "")")
                                    .foregroundColor(.white.opacity(0.4))
                                    .font(.subheadline)
                                
                                Text("for iOS 14.6 - 14.8")
                                    .foregroundColor(.white.opacity(0.4))
                                    .font(.subheadline)
                            }
                            Spacer()
                        }
                        Divider()
                        HStack {
                            Image("Cheyote")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .opacity(0.2)
                                .shadow(color: Color.black.opacity(0.1), radius: 10)
                            Text(LocalizedStringKey("UI inspired by Cheyote, a jailbreak that never came to be."))
                                .foregroundColor(.white.opacity(0.4))
                                .font(.subheadline)
                        }
                        Divider()
                        HStack {
                            Text(LocalizedStringKey("Made with 💜 by palera1n team"))
                                .foregroundColor(.white.opacity(0.4))
                                .font(.subheadline)
                            Spacer()
                            Button(action: {
                                showAlert = true
                            }) {
                                Image(systemName: "text.bubble")
                                    .foregroundColor(.white.opacity(0.4))
                            }
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text(""),
                                    message: Text("\(dayString)"),
                                    dismissButton: .default(Text("OK"))
                                )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
                    .frame(height: 120)
            }
            .applyLinearGradientMask()
        }
        .padding()
        .animation(.easeInOut)
        .shadow(color: Color.black.opacity(0.1), radius: 10)
    }
    private func openURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}
