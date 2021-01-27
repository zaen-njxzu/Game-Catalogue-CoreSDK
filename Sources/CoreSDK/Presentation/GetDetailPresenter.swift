//
//  GetDetailPresenter.swift
//  
//
//  Created by Zaenal Arsy on 27/01/21.
//

import Foundation

public class GetDetailPresenter<PassingObject, Request, Response, InteractorGet: UseCase>: ObservableObject where InteractorGet.Request == Request, InteractorGet.Response == Response {
  
  private var cancellables: Set<AnyCancellable> = []
  
  private let _useCaseGet: InteractorGet?
  
  var passingObject: PassingObject
  
  @Published public var detail: Response?
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false
  
  public init(passingObject: PassingObject, useCaseGet: Interactor?) {
    self._useCaseGet = useCaseGet
    self.passingObject = passingObject
  }
  
  public func getDetail(request: Request?) {
    isLoading = true
    if let _useCase = self._useCaseGet {
      _useCase.execute(request: request)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
          switch completion {
          case .failure(let error):
            self.errorMessage = error.localizedDescription
            self.isError = true
            self.isLoading = false
          case .finished:
            self.isLoading = false
          }
        }, receiveValue: { detail in
          self.detail = detail
        })
        .store(in: &cancellables)
    } else {
      self.errorMessage = "Usecase has no value."
      self.isError = true
      self.isLoading = false
    }
  }
  
  public func modifyPassingObject(completion: @escaping (AlertOneMessage) -> Void) {
    
  }
}
