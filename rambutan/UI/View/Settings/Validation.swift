//
//  Validation.swift
//  rambutan
//
//  Created by samara on 6/17/23.
//

import Foundation

class Validation {
    public static func compatCheck() -> Bool {
        let ver = DeviceInfo.current.version
        let arch = DeviceInfo.current.arch
        let type = DeviceInfo.current.platformName

        if (ver < "14.6" || ver > "14.8") {return false}
        return true
    }
}

func isSimulator() -> Bool {
    #if targetEnvironment(simulator) || DEBUG
    return true
    #else
    return false
    #endif
}
