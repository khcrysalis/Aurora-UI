//
//  Credits.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI
import URLImage

struct Credits: View {
    
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack {
                    Section(header:
                        CustomSectionHeader(title: "Credits & Contributors")
                    ) {
                        Button(action: {
                            showAlert = true
                        }) {
                            HStack {
                                Text("More credits can be found here")
                                    .foregroundColor(Color(UIColor.label).opacity(0.4))
                                    .font(.subheadline)
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .foregroundColor(Color(UIColor.label).opacity(0.4))
                                    .font(Font.body.weight(.heavy))
                                    .frame(width: 5, height: 9)


                            }
                            .padding(.bottom, 10)
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Some title for later"),
                                message: Text("Some message for later"),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                        
                        VStack {
                            createButtonWithImage(imageURL: URL(string: "https://github.com/mineek.png")!, buttonText: "mineek", subtext: "Developer", linkURL: URL(string: "https://github.com/mineek")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/flowerible.png")!, buttonText: "samiiau", subtext: "UI & Design", linkURL: URL(string: "https://github.com/flowerible")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/llsc12.png")!, buttonText: "Lakhan Lothiyi", subtext: "UI & App help", linkURL: URL(string: "https://github.com/llsc12")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/potmdehex.png")!, buttonText: "John Aakerblom", subtext: "Multicast Bytecopy Backport", linkURL: URL(string: "https://twitter.com/potmdehex")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/opa334.png")!, buttonText: "opa334", subtext: "Dopamine jailbreakd", linkURL: URL(string: "https://twitter.com/opa334dev")!)
                        }
                    }
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
