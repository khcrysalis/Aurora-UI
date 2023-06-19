//
//  DeviceInfo.swift
//  rambutan
//
//  Created by Staturnz on 6/19/23.
//

import Foundation
import CoreFoundation
import SystemConfiguration
import MachO
import UIKit.UIDevice

// Filters model numbers (e.g. iPhone10,4 --> [10, 4])
private func filterModel(_ ident: String) -> [Int] {
    var filtered = ident
    for type in ["iPhone", "iPad", "iPod", "AppleTV", "Watch"] {
        filtered = filtered.replacingOccurrences(of: type, with: "")
    }
    
    let first = Int("\(filtered.components(separatedBy: ",")[0])")!
    let second = Int("\(filtered.components(separatedBy: ",")[1])")!
    return [first, second]
}

class info {
    // Gets CoreFoundation Version (e.g. 1900)
    public static func getCFVer(_ exact: Bool = false) -> Int {
        let CFVersionNumber = kCFCoreFoundationVersionNumber
        if (exact) {return Int(floor(kCFCoreFoundationVersionNumber))}
        
        return Int(floor(kCFCoreFoundationVersionNumber / 100) * 100)
    }

    // Gets device platform (e.g. iOS, iPadOS, WatchOS, etc)
    public static func getDevicePlatform() -> String {
        let platform = UIDevice.current.systemName
        let model = UIDevice.current.model
        
        if (platform == "iPhone OS") {return "iOS"}
        if (platform == "iOS" && model == "iPad") {return "iPadOS"}
        if (platform.isEmpty) {return "Unknown Platform"}
        
        return platform
    }
    
    // Gets device architecture (e.g. arm64 or arm64e)
    public static func getArchitecture() -> String {
#if targetEnvironment(simulator)
        let ident = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
        let num = filterModel(String(ident))[0]
        
        switch (ident) {
        case _ where ident.starts(with: "iPhone"):
            return num >= 11 ? "arm64e" : "arm64"
        case _ where ident.starts(with: "iPad"):
            if (num == 8) {return "arm64e"}
            return num >= 11 ? "arm64e" : "arm64"
        case _ where ident.starts(with: "iPod"):
            return "arm64"
        default:
            return "Unknown Architecture"
        }
#else
        let archInfo = NXGetLocalArchInfo().pointee.name
        return String(cString: archInfo) ?? "Unknown Architecture"
#endif
    }
    
    // Gets OS Version (e.g. 14.7.1)
    public static func getOSVersion() -> String {
        let systemVer = ProcessInfo().operatingSystemVersion
        
        let major = String(systemVer.majorVersion)
        let minor = String(systemVer.minorVersion)
        let patch = String(systemVer.patchVersion)
        
        if (patch == "0" || patch == "") {
            return "\(major).\(minor)"
        }
        
        return "\(major).\(minor).\(patch)"
    }
    
    // Gets device model (e.g. iPhone X or iPhone 6s Plus)
    public static func getModelName() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror(reflecting: systemInfo.machine)
        
#if targetEnvironment(simulator)
        let ident = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
#else
        let ident = mirror.children.reduce("") { ident, element in
            guard let value = element.value as? Int8, value != 0 else { return ident }
            return ident + String(UnicodeScalar(UInt8(value)))
        }
#endif
 
        let filtered = filterModel(String(ident))
        let num = filtered[0]
        let last = filtered[1]

        switch(ident) {
        case "iPod9,1": return "iPod touch (7th gen)"
        case _ where ident.starts(with: "iPhone"):
            switch(num) {
            case 8:
                if (last == 4) {return "iPhone SE"}
                return last % 2 == 0 ? "iPhone 6s Plus" : "iPhone 6s"
            case 9:
                return last % 2 == 0 ? "iPhone 7 Plus" : "iPhone 7"
            case 10:
                if (last == 3 || last == 6) {return "iPhone X"}
                return (last == 1 || last == 4) ? "iPhone 8" : "iPhone 8 Plus"
            case 11:
                if (last == 8) {return "iPhone XR"}
                return last == 2 ? "iPhone XS" : "iPhone XS Max"
            case 12:
                if (last == 1) {return "iPhone 11"}
                if (last == 8) {return "iPhone SE (2nd gen)"}
                return last == 3 ? "iPhone 11 Pro" : "iPhone 11 Pro Max"
            case 13:
                if (last <= 2) {return last % 2 == 0 ? "iPhone 12" : "iPhone 12 Mini"}
                return last % 2 == 0 ? "iPhone 12 Pro Max" : "iPhone 12 Pro"
            default: return "Unsupported Device"
            }
        case _ where ident.starts(with: "iPad"):
            switch(num) {
            case 5:
                if (last < 3) {return "iPad mini 4"}
                return "iPad Air 2"
            case 6:
                if (last < 5) {return "iPad Pro (9.7-inch)"}
                if (last < 9) {return "iPad Pro (12.9-inch) (1st gen)"}
                return "iPad (5th gen)"
            case 7:
                if (last < 3) {return "iPad Pro (12.9-inch) (2nd gen)"}
                if (last < 5) {return "iPad Pro (10.5-inch)"}
                if (last < 7) {return "iPad (6th gen)"}
                return "iPad (7th gen)"
            case 8:
                if (last < 5) {return "iPad Pro 11-inch (1st gen)"}
                if (last < 9) {return "iPad Pro 12.9-inch (3rd gen)"}
                if (last < 11) {return "iPad Pro 11-inch (2nd gen)"}
                return "iPad Pro 12.9-inch (4th gen)"
            case 11:
                if (last < 3) {return "iPad mini (5th gen)"}
                if (last < 5) {return "iPad Air (3rd gen)"}
                return "iPad (8th gen)"
            case 13:
                if (last < 3) {return "iPad Air (4th gen)"}
                if (last < 8) {return "iPad Pro 11-inch (3rd gen)"}
                return "iPad Pro 12.9-inch (5th gen)"
            default: return "Unsupported Device"
            }

        default: return "Unsupported Device"
        }
    }
}

