//
//  Factory.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-10.
//

import Foundation

class Factory: Codable {
    var id: Int
    var name: String
    var address: String
    var country: String
    var division: String
}

extension Factory: Equatable, Hashable {
    
    static func == (lhs: Factory, rhs: Factory) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
