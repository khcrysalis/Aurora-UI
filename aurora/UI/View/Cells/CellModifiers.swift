//
//  CellModifiers.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CustomSectionHeader: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.bold(.headline)())
                .foregroundColor(.white)
                .textCase(.none)
                .padding(.bottom, 5)
                .padding(.leading, 25)
            Spacer()
        }
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
                WebImage(url: imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 47, height: 47)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .padding(.trailing, 5)
                    .transition(.fade(duration: 0.3))
                
                
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

func createButton(text: String, action: @escaping () -> Void) -> some View {
    return Button(action: action) {
        HStack {
            Spacer()
                Text(text)
                    .foregroundColor(Color(UIColor.label))
                    .opacity(Validation.isCompatible ? 1 : 0.5)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .font(Font.body.weight(.semibold))
                    .opacity(Validation.isCompatible ? 1 : 0.5)
        }
        .padding()
        .background(Blur(style: .systemThinMaterial))
        .foregroundColor(.white)
        .cornerRadius(26)
        .padding(.bottom, 5)
    }
    .disabled(!isSimulator() && !Validation.isCompatible)
}

func createLButton(text: String, subtext: String, action: @escaping () -> Void, infoaction: @escaping () -> Void) -> some View {
    return Button(action: action) {
        HStack {
            VStack(alignment: .leading) {
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

