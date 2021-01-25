//
//  UseCase.swift
//  
//
//  Created by Zaenal Arsy on 25/01/21.
//

import Foundation
import Combine

public protocol UseCase {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
