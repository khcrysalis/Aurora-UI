//
//  Validation.swift
//  rambutan
//
//  Created by samara on 6/17/23.
//

import Foundation


// For UI Testing/Debugging
private let debugBypass = false // Ignore compatibility if debugging
private let simulatorBypass = true // Ignore compatibility if simulator
private let forceCompat = false // Force compatibility with no checks

private func isDebugging() -> Bool {
    var proc = kinfo_proc()
    var size = MemoryLayout.stride(ofValue: proc)
    var mib: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
    let sysctl = sysctl(&mib, UInt32(mib.count), &proc, &size, nil, 0)
    
    if (sysctl != 0) {return false}
    let debugging = proc.kp_proc.p_flag & P_TRACED
    if ((debugging == 0)) {return false}

    return true
}

func isSimulator() -> Bool {
#if targetEnvironment(simulator)
    return true
#else
    return false
#endif
}

class Validation {
    public static var isCompatible = false
    
    public static func compatibilityCheck() -> Bool {
        let arch = DeviceInfo.current.modelArch
        let osVer = DeviceInfo.current.platformVer
        let osName = DeviceInfo.current.platformName

        let systemVer = ProcessInfo().operatingSystemVersion
        let validPlatforms = ["iOS", "iPadOS"]
        
        // For UI Testing/Debugging
        if (isDebugging() && debugBypass) {isCompatible = true; return true}
        if (isSimulator() && simulatorBypass) {isCompatible = true; return true}
        if (forceCompat) {isCompatible = true; return true}

        if (arch.isEmpty || !arch.contains("arm64")) {
            print("[-] Incompatible Architecture: \(arch)")
            return false
        }
        
        if (!validPlatforms.contains(osName)) {
            print("[-] Incompatible Platform: \(osName)")
            return false
        }
        
        if (systemVer.majorVersion != 14) {
            print("[-] Incompatible Version: \(osName) \(osVer)")
            return false
        }
        
        if (!(systemVer.minorVersion >= 6) && !(systemVer.minorVersion <= 8)) {
            print("[-] Incompatible Version: \(osName) \(osVer)")
            return false
        }
        
        isCompatible = true
        return true
    }
}

