//
//  FactoriesService.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-13.
//

import Foundation

protocol FactoryServiceProvider: class {
    func fetchFactories(offset: String?, completion: @escaping FactoriesResponse)
}

typealias FactoriesResponse = (Result<PageResource<Factory>, Error>) -> Void

class FactoryService: FactoryServiceProvider {
    
    // MARK: Attributes
    
    private let networkManager: NetworkClient
    
    // MARK: Lifecycle
    
    // Ensures dependency injection can be made
    init(networkManager: NetworkClient = NetworService()) {
        self.networkManager = networkManager
    }
    
    // MARK: Service methods
    
    func fetchFactories(offset: String?, completion: @escaping FactoriesResponse) {
        // Kinda weird not to have a path for the resources, but it works jsut fine.
        networkManager.request(PageResource<Factory>.self,
                               endpoint: .init(method: .get, path: "", parameters: ["offset": offset ?? "0"]),
                               completion: completion)
    }
    
}
