//
//  Customization.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI

class Customization: ObservableObject {
    @Published var isRestoreRootfsEnabled = false
    @Published var isTweaksEnabled = true
    @Published var isOTAEnabled = true
    @Published var isLogsEnabled = true
    static let shared = Customization()
}


