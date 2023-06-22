//
//  Console.swift
//  rambutan
//
//  Created by Lakhan Lothiyi on 18/06/2023.
//

import Foundation

final class Console: ObservableObject {
    static let shared = Console()

    @Published var logs: [Log] = []

    func clear() {
        logs.removeAll()
    }

    func log(_ msg: String, type: Log.LogType = .info) {
        let log = Log(message: msg, type: type)
        DispatchQueue.main.async {
            self.logs.insert(log, at: 0)
        }
    }

}

extension Console {
    struct Log: Identifiable, Equatable {
        let id = UUID()
        let message: String
        let type: LogType

        enum LogType {
            case info, warning, error
        }
    }

    var line1: Log? {
        logs.first
    }
}
