//
//  LocalDataSource.swift
//  
//
//  Created by Zaenal Arsy on 25/01/21.
//

import Foundation
import Combine

public protocol LocalDataSource {
  associatedtype Request
  associatedtype Response
  
  func get() -> AnyPublisher<[Response], Error>
  func add(from entities: [Response]) -> AnyPublisher<Bool, Error>
  func set(by id: Request) -> AnyPublisher<Response, Error>
}
