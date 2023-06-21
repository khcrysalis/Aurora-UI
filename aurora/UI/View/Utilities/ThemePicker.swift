//
//  ThemePicker.swift
//  rambutan
//
//  Created by samara on 19/06/2023.
//

import Foundation

struct Theme: Identifiable, Hashable {
    static let appThemes = [
        Theme(name: "Flower", image: "milad-fakurian-u8Jn2rzYIps-unsplash"),
        Theme(name: "Nebula", image: "magicpattern-65O4Dw6-xLg-unsplash")
    ]
    
    var name: String
    var image: String
    
    var id: String { name }
}


