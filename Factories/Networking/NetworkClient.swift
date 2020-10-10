//
//  NetworkClient.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-10.
//

import Foundation

protocol NetworkClient: class {
    func request<Resource: Decodable>(_: Resource.Type, endpoint: Endpoint<Resource>,
                                      completion: @escaping (Result<Resource, Error>) -> Void)
}

class NetworService: NetworkClient {
    
    var apiURL: URL {
        let baseUrl = Environment.getValue(forKey: .baseURL)
        let apiPrefix = Environment.getValue(forKey: .apiPrefix)
        return URL(string: baseUrl + apiPrefix)!
    }
    
    func request<Resource: Decodable>(_: Resource.Type, endpoint: Endpoint<Resource>,
                                      completion: @escaping (Result<Resource, Error>) -> Void) {
        
        let endpointURL = apiURL.appendingPathComponent(endpoint.path)
        
        var request = URLRequest(url: endpointURL)
        
        // Adds query params
        if endpoint.method == .get, let params = endpoint.parameters {
            var components = URLComponents(url: endpointURL, resolvingAgainstBaseURL: false)!
            
            for (key, value) in params {
                components.queryItems?.append(URLQueryItem(name: key, value: "\(value)"))
            }
            
            request.url = components.url
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(Resource.self, from: data!)
                completion(.success(response))
                return
            } catch {
                // TODO: Replace with a proper error
                let error = NSError(domain: "network", code: 120, userInfo: [:])
                completion(.failure(error))
                return
            }
        }
        
        task.resume()
    }
    
}
