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
    static let version = UIDevice.current.systemVersion
    static let arch = String(cString: NXGetLocalArchInfo().pointee.name)
    let d = HostManager.self
    let machinename = d.getModelName() ?? "Unknown"
    let modelarch = d.getModelArchitecture() ?? "Unknown"
    let platformname = d.getPlatformName() ?? "Unknown"
    let platformver = d.getPlatformVersion() ?? "Unknown"
}
