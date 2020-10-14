//
//  MockFactoriesService.swift
//  FactoriesTests
//
//  Created by Raphael Souza on 2020-10-13.
//

import Foundation
@testable import Factories

class MockFactoriesService: FactoryServiceProvider {
    
    let networkService: NetworkClient = MockNetworkService()
    
    func fetchFactories(offset: String?, completion: @escaping FactoriesResponse) {
        networkService.request(PageResource<Factory>.self,
                               endpoint: .init(method: .get, path: "", parameters: ["offset": offset]),
                               completion: completion)
    }
    
}
