//
//  Coordinator.swift
//
//  Created by Raphael Souza on 2020-09-24.
//  Copyright © 2020 Raphael Inc. All rights reserved.
//

import Foundation

/// The Coordinator protocol
public protocol Coordinator: class {
        
    /// The array containing any child Coordinators
    var childCoordinators: [Coordinator] { get set }
    
}

public extension Coordinator {
    
    /// Add a child coordinator to the parent
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    /// Remove a child coordinator from the parent
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
    
}
