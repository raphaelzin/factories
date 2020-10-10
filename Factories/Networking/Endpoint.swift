//
//  Endpoint.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-10.
//

import Foundation

enum Method {
    case get, post, put, patch, delete
}

typealias Parameters = [String: Any]

class Endpoint<Response> {
    let method: Method
    let path: String
    let parameters: Parameters?

    init(method: Method = .get,
         path: String,
         parameters: [String: AnyHashable]? = nil) {
        self.method = method
        self.path = path
        self.parameters = parameters
    }
}
