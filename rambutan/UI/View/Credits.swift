//
//  Credits.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI
import URLImage

struct Credits: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack {
                    Section(header:
                        CustomSectionHeader(title: "Credits & Contributors")
                    ) {
                        Button(action: {
                            if let url = URL(string: "https://google.com") {
                                UIApplication.shared.open(url)
                            }
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
                        
                        VStack {
                            createButtonWithImage(imageURL: URL(string: "https://github.com/mineek.png")!, buttonText: "mineek", subtext: "Developer", linkURL: URL(string: "https://github.com/mineek")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/flowerible.png")!, buttonText: "samiiau", subtext: "UI & Design", linkURL: URL(string: "https://github.com/flowerible")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/llsc12.png")!, buttonText: "Lakhan Lothiyi", subtext: "UI & Design", linkURL: URL(string: "https://github.com/llsc12")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/Odyssey-Team.png")!, buttonText: "Odyssey Team", subtext: "Taurine jailbreak", linkURL: URL(string: "https://github.com/orgs/Odyssey-Team/people")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/potmdehex.png")!, buttonText: "John Aakerblom", subtext: "Multicast Bytecopy Backport", linkURL: URL(string: "https://twitter.com/potmdehex")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/opa334.png")!, buttonText: "opa334", subtext: "Dopamine jailbreakd", linkURL: URL(string: "https://twitter.com/opa334dev")!)
                        }
                    }
                }
                .shadow(color: Color.black.opacity(0.1), radius: 10)
                .padding(10)
                .padding(.bottom, 30)
            }
            .padding()
        }
        .animation(.easeInOut)
    }
}
// https://github.com/ProcursusTeam
