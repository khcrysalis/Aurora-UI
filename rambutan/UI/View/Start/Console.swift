//
//  Console.swift
//  rambutan
//
//  Created by Lakhan Lothiyi on 18/06/2023.
//

import Foundation

class Console: ObservableObject {
  static let shared = Console()
  
  @Published var logs: [Log] = []
  
  func clear() { self.logs.removeAll() }
  
  func log(_ msg: String, type: Log.LogType = .info) {
	let log = Log(message: msg, type: type)
	logs.insert(log, at: 0)
  }
  
  struct Log: Identifiable {
	let id = UUID()
	let message: String
	let type: LogType
	
	enum LogType {
	  case info
	  case warning
	  case error
	}
  }
  
}

extension Console.Log: Equatable {}

extension Console {
  var line1: Log? {
	self.logs.first
  }
  
  var line2: Log? {
	self.logs.first { log in
	  let index = self.logs.firstIndex { meow in log == meow }
	  return index == 1
	}
  }
  
  var line3: Log? {
	self.logs.first { log in
	  let index = self.logs.firstIndex { meow in log == meow }
	  return index == 2
	}
  }
}
