//
//  PagedResource.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-10.
//

import Foundation

class PageResource<T: Codable>: Codable {
    var count: Int
    var results: [T]
    
    // Pagination access
    var next: String?
    var previous: String?
}
