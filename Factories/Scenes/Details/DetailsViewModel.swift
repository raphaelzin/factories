//
//  DetailsViewModel.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-14.
//

import Foundation

protocol DetailsViewModelType: class {
    var factory: Factory { get }
}

class DetailsViewModel: DetailsViewModelType {
    
    let factory: Factory
    
    init(factory: Factory) {
        self.factory = factory
    }
    
}
