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
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(Color(UIColor.label).opacity(0.4))
                    .shadow(color: Color.black.opacity(0.1), radius: 10)
                Spacer()
                VStack {
                    Section(header:
                        CustomSectionHeader(title: "Credits & Contributors")
                    ) {
                        VStack {
                            createButtonWithImage(imageURL: URL(string: "https://github.com/mineek.png")!, buttonText: "mineek", subtext: "Example", linkURL: URL(string: "https://github.com/mineek")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/flowerible.png")!, buttonText: "samiiau", subtext: "Example", linkURL: URL(string: "https://github.com/flowerible")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/coolstar.png")!, buttonText: "CoolStar", subtext: "Example", linkURL: URL(string: "https://github.com/coolstar")!)
                            createButtonWithImage(imageURL: URL(string: "https://github.com/ProcursusTeam.png")!, buttonText: "Procursus", subtext: "Example", linkURL: URL(string: "https://github.com/ProcursusTeam")!)
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
