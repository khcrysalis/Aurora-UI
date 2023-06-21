//
//  Logging.swift
//  rambutan
//
//  Created by samara on 6/17/23.
//

import Foundation
import SwiftUI

enum JBStatus {
    case notStarted
    case unsupported
    case inProgress
    case failed
    case done
    
    func text() -> String {
        switch self {
        case .notStarted:
            return "Jailbreak"
            
        case .unsupported:
            return "Unsupported"
            
        case .inProgress:
            return "Jailbreaking..."
            
        case .failed:
            return "Error!"
            
        case .done:
            return "Jailbroken"
        }
    }
    
    func color() -> Color {
        switch self {
        case .notStarted:
            return .accentColor
            
        case .unsupported:
            return .accentColor
            
        case .inProgress:
            return .accentColor
            
        case .failed:
            return .red
            
        case .done:
            return .green
        }
    }
}
