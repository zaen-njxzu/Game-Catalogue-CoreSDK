//
//  CustomError+Ext.swift
//  
//
//  Created by Zaenal Arsy on 25/01/21.
//

import Foundation

public enum URLError: LocalizedError {
  
  case invalidResponse
  case invalidParameter
  case addressUnreachable(URL)
  
  public var errorDescription: String? {
    switch self {
    case .invalidResponse: return "The server responded with garbage."
    case .invalidParameter: return "Request is invalid."
    case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
    }
  }
  
}

public enum DatabaseError: LocalizedError {
  
  case invalidInstance
  case invalidParameter
  case requestFailed
  
  public var errorDescription: String? {
    switch self {
    case .invalidInstance: return "Database can't instance."
    case .invalidParameter: return "Request is invalid."
    case .requestFailed: return "Your request failed."
    }
  }
}
