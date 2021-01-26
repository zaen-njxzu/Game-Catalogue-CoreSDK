//
//  Mapper.swift
//  
//
//  Created by Zaenal Arsy on 25/01/21.
//

public protocol Mapper {
  associatedtype Response
  associatedtype Entity
  associatedtype Domain
  
  func transformResponseToEntity(response: Response) -> Entity
  func transformEntityToDomain(entity: Entity) -> Domain
  func transformResponseToDomain(response: Response) -> Domain
}

