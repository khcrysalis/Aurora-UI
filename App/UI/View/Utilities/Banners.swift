//
//  Banners.swift
//  Aurora
//
//  Created by samara on 6/28/23.
//

import Foundation
import SwiftUI

enum AORABanners {
    case demoMode
    case noncesuccess
    case nonceerror
    
    var toast: AlertToast? {
        switch self {
        case .demoMode:
            return AlertToast(displayMode: .banner(.pop),
                              type: .systemImage("exclamationmark.triangle.fill", Color(UIColor.label).opacity(0.4)),
                              title: "AORAInteractor is in Demo Mode",
                              subTitle: "This will not actually jailbreak your device.")
        case .noncesuccess:
            return AlertToast(displayMode: .banner(.pop),
                              type: .systemImage("checkmark.circle.fill", Color(UIColor.label).opacity(0.4)),
                              title: "Success",
                              subTitle: "The generator will be set every time you activate Aurora.")
        case .nonceerror:
            return AlertToast(displayMode: .banner(.pop),
                              type: .systemImage("exclamationmark.triangle.fill", Color(UIColor.label).opacity(0.4)),
                              title: "Error",
                              subTitle: "That doesn't look right. The generator should start with 0x and contain 16 digits/letters A to F.")
        }
    }
}
func defaultToast() -> AlertToast {
    return AlertToast(displayMode: .banner(.pop),
                      type: .systemImage("questionmark.circle.fill", Color(UIColor.label).opacity(0.4)),
                      title: "Primal | Lamia",
                      subTitle: """
                                Some say a few are chosen and the rest are dregs, but I say we humans have our humanity.
                                
                                We will defy this world with a power from beyond.
                                """)
}


class ToastState: ObservableObject {
    @Published var showToast = false
    @Published var activeToast: AORABanners? = nil
    
    func show(toast: AORABanners) {
        activeToast = toast
        showToast = true
    }
}
