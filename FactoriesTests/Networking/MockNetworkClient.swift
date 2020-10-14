//
//  MockNetworkClient.swift
//  FactoriesTests
//
//  Created by Raphael Souza on 2020-10-14.
//

import Foundation
@testable import Factories

class MockNetworkService: NetworkClient {
    
    func request<Resource>(_: Resource.Type, endpoint: Endpoint<Resource>, completion: @escaping (Result<Resource, Error>) -> Void) where Resource : Decodable {
        
        let path = Bundle(for: type(of: self )).path(forResource: "validResponse", ofType: "json")!
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            let page = try JSONDecoder().decode(Resource.self, from: jsonData)
            completion(.success(page))
        } catch {
            completion(.failure(error))
        }
        
    }
    
}
