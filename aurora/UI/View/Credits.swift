//
//  Credits.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI
import URLImage

let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
let appName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String

struct Credits: View {
    
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    
                    ScrollView(showsIndicators: false) {
                        Spacer()
                            .frame(height: 120)
                        Section(header:
                                    CustomSectionHeader(title: "Credits and Acknowledgements")
                        ) {
                            createButtonWithImage(imageURL: URL(string: "https://github.com/mineek.png")!, buttonText: "mineek", subtext: "Developer", linkURL: URL(string: "https://github.com/mineek")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/samiiau.png")!, buttonText: "samiiau", subtext: "UI & Design", linkURL: URL(string: "https://github.com/samiiau")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/llsc12.png")!, buttonText: "Lakhan Lothiyi", subtext: "UI & App help", linkURL: URL(string: "https://github.com/llsc12")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/staturnzz.png")!, buttonText: "Staturnz", subtext: "App help", linkURL: URL(string: "https://github.com/staturnzz")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/potmdehex.png")!, buttonText: "John Aakerblom", subtext: "Multicast Bytecopy Backport", linkURL: URL(string: "https://twitter.com/potmdehex")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/opa334.png")!, buttonText: "opa334", subtext: "Dopamine jailbreakd", linkURL: URL(string: "https://twitter.com/opa334dev")!)
                        }
                        Section(header:
                                    CustomSectionHeader(title: "Licensing")
                        ) {
                            createLButton(text: "SwiftUIBackports", subtext: "MIT License", action: {
                                if let url = URL(string: "https://github.com/shaps80/SwiftUIBackports") {
                                    UIApplication.shared.open(url)
                                }
                                
                            }, infoaction: {
                                if let url = URL(string: "https://github.com/shaps80/SwiftUIBackports/blob/main/LICENSE.md") {
                                    UIApplication.shared.open(url)
                                }
                                
                            })
                            createLButton(text: "AlertToast", subtext: "MIT License", action: {
                                
                                if let url = URL(string: "https://github.com/elai950/AlertToast") {
                                    UIApplication.shared.open(url)
                                }
                                
                            }, infoaction: {
                                
                                if let url = URL(string: "https://github.com/elai950/AlertToast/blob/master/LICENSE.md") {
                                    UIApplication.shared.open(url)
                                }
                                
                            })
                            createLButton(text: "URLImage", subtext: "MIT License", action: {
                                if let url = URL(string: "https://github.com/dmytro-anokhin/url-image") {
                                    UIApplication.shared.open(url)
                                }
                                
                            }, infoaction: {
                                if let url = URL(string: "https://github.com/dmytro-anokhin/url-image/blob/main/LICENSE") {
                                    UIApplication.shared.open(url)
                                }
                                
                            })
                        }
                        Section(header:
                                    CustomSectionHeader(title: "About")
                        ) {
                            Text(LocalizedStringKey("\(appName ?? "") \(appVersion ?? "") (Build: \(appBuild ?? ""))"))
                                .foregroundColor(Color(UIColor.label).opacity(0.4))
                                .font(.headline)
                            Text("Sample Text")
                                .foregroundColor(Color(UIColor.label).opacity(0.4))
                                .font(.subheadline)
                        }
                        Spacer()
                            .frame(height: 120)
                    }
                    .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .black, .clear]), startPoint: .bottom, endPoint: .top))
                    .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .black, .clear]), startPoint: .top, endPoint: .bottom))
                }
                .shadow(color: Color.black.opacity(0.1), radius: 10)
                .padding(.vertical, 10)
                .padding(.bottom, 30)
            }
            .padding()
            
        }
        
        .animation(.easeInOut)
    }
}
