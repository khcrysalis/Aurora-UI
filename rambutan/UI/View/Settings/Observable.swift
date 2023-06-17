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
  
  let version = UIDevice.current.systemVersion
  let arch = String(cString: NXGetLocalArchInfo().pointee.name)
  
  init() {
	let d = HostManager.self
	
	self.machineName = d.getModelName() ?? "Unknown"
	self.modelArch = d.getModelArchitecture() ?? "Unknown"
	self.platformName = d.getPlatformName() ?? "Unknown"
	self.platformVer = d.getPlatformVersion() ?? "Unknown"
  }
  
  let machineName: String
  let modelArch: String
  let platformName: String
  let platformVer: String
}
