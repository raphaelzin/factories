//
//  Errors.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-14.
//

import Foundation

struct RSError {
    
    enum ServerError: Error {
        case unknown
    }
    
    enum Misc: Error {
        case invalidPagingOffset
    }
    
}

extension RSError.Misc: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .invalidPagingOffset: return NSLocalizedString("invalid-offset-error", comment: "Invalid paging offset")
        }
    }
    
}

extension RSError.ServerError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .unknown: return NSLocalizedString("generic-server-error", comment: "Generic server error message")
        }
    }
    
}
