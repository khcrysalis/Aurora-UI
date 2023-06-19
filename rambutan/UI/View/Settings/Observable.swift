//
//  Customization.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI
import MachO

class Settings: ObservableObject {
    @Published var isRestoreRootfsEnabled = false
    @Published var isTweaksEnabled = true
    @Published var isOTAEnabled = true
    @Published var isLogsEnabled = true
    static let shared = Settings()
}

struct DeviceInfo {
    static let current = DeviceInfo()

    init() {
        self.machineName = info.getModelName()
        self.modelArch = info.getArchitecture()
        self.platformName = info.getDevicePlatform()
        self.platformVer = info.getOSVersion()
    }

    let machineName: String
    let modelArch: String
    let platformName: String
    let platformVer: String
}
