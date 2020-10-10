//
//  HomeCoordinator.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-10.
//

import UIKit

class HomeCoordinator: RootViewCoordinator {
    
    // MARK: Attributes
    
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController = {
        HomeViewController()
    }()
    
    // MARK: Lifecycle
    
    func start() {
        
    }
    
}
