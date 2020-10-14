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
        UINavigationController()
    }()
    
    // MARK: Lifecycle
    
    func start() {
        let homeController = HomeViewController()
        homeController.coordinatorDelegate = self
        
        let navController = rootViewController as? UINavigationController
        navController?.pushViewController(homeController, animated: true)
    }
    
}

extension HomeCoordinator: HomeViewControllerCoordinatorDelegate {
    
    func didSelect(_ factory: Factory) {
        // TODO: send the factory object to details scene
    }
    
}
