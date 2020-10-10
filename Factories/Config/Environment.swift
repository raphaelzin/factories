//
//  Environment.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-10.
//

import Foundation

extension Environment {
    enum Variable: String {
        case appName = "APP_NAME"
        case baseURL = "BASE_URL"
        case apiPrefix = "API_PREFIX"
    }
}

struct Environment {
    static func getValue(forKey key: Variable) -> String {
        return infoForKey(key.rawValue)
    }
    
    private static func infoForKey(_ key: String) -> String {
        guard let value = (Bundle.main.infoDictionary?[key] as? String) else {
            fatalError("Could not get value for key: \(key)")
        }
        return value.replacingOccurrences(of: "\\", with: "")
    }
}
