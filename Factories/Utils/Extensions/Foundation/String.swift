//
//  String.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-14.
//

import Foundation

extension String {
    
    var asCountryFlag: String? {
        self
            .unicodeScalars
            .map({ 127397 + $0.value })
            .compactMap(UnicodeScalar.init)
            .map(String.init)
            .joined()
    }
    
    var asCountryName: String? {
        (Locale.current as NSLocale).displayName(forKey: .countryCode, value: self)
    }
    
}
