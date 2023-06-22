//
//  CellModifiers.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import Foundation
import SwiftUI
import URLImage


struct CustomSectionHeader: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.bold(.headline)())
            .foregroundColor(Color(UIColor.label))
            .textCase(.none)
            .padding(.bottom, 5)
    }
}

struct JailbreakSectionHeader: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.bold(.headline)())
            .foregroundColor(.white)
            .textCase(.none)
            .padding(.leading, 20)
    }
}

func createButtonWithImage(imageURL: URL, buttonText: String, subtext: String, linkURL: URL) -> some View {
    return VStack {
        Button(action: {
            UIApplication.shared.open(linkURL)
        }) {
            HStack {
                URLImage(imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 47, height: 47)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.trailing, 5)
                VStack(alignment: .leading) {
                    Text(buttonText)
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(UIColor.label))
                        .alignmentGuide(.leading) { _ in 0 }
                    
                    Text(subtext)
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .alignmentGuide(.leading) { _ in 0 }
                }
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .font(Font.body.weight(.semibold))
            }
            .padding()
            .background(Blur(style: .systemThinMaterial))
            .foregroundColor(.white)
            .cornerRadius(26)
        }
        .padding(.bottom, 5)
    }
}

func createButton(text: String, action: @escaping () -> Void, isDisabled: @escaping () -> Bool) -> some View {
    return Button(action: action) {
        HStack {
            Spacer()
            if isDisabled() {
                Text(text)
                    .foregroundColor(Color(UIColor.label).opacity(0.5))
                Spacer()
            } else {
                Text(text)
                    .foregroundColor(Color(UIColor.label))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .font(Font.body.weight(.semibold))
            }
        }
        .padding()
        .background(Blur(style: .systemThinMaterial))
        .foregroundColor(.white)
        .cornerRadius(26)
        .padding(.bottom, 5)
    }
    .disabled(isDisabled())
}

func createLButton(text: String, subtext: String, action: @escaping () -> Void, infoaction: @escaping () -> Void) -> some View {
    return Button(action: action) {
        HStack {
            VStack {
                Text(text)
                    .foregroundColor(Color(UIColor.label))
                Text(subtext)
                    .foregroundColor(Color(UIColor.secondaryLabel))
            }
            Spacer()
            Image(systemName: "info.circle")
                .foregroundColor(Color(UIColor.secondaryLabel))
                .font(Font.body.weight(.semibold))
                .onTapGesture {
                    infoaction()
                }
            Image(systemName: "arrow.up.right")
                .foregroundColor(Color(UIColor.secondaryLabel))
                .font(Font.body.weight(.semibold))
        }
        .padding()
        .background(Blur(style: .systemThinMaterial))
        .foregroundColor(.white)
        .cornerRadius(26)
        .padding(.bottom, 5)
    }
}

