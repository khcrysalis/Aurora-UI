//
//  ThemePicker.swift
//  rambutan
//
//  Created by samara on 19/06/2023.
//

import Foundation

struct Theme: Identifiable, Hashable {
    static let appThemes = [
        Theme(name: "Aurora", image: "milad-fakurian-u8Jn2rzYIps-unsplash"),
        Theme(name: "Azure", image: "magicpattern-65O4Dw6-xLg-unsplash"),
        Theme(name: "Borealis", image: "northern-lights"),
        Theme(name: "Crawford", image: "absolutely-flowerible"),
        Theme(name: "Scarlet", image: "northern-lights-red")
    ]
    
    var name: String
    var image: String
    
    var id: String { name }
}


