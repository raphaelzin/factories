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
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    private lazy var navigationController: UINavigationController = {
        let navController = UINavigationController()
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }()
    
    // MARK: Lifecycle
    
    func start() {
        let homeController = HomeViewController()
        homeController.coordinatorDelegate = self
        navigationController.pushViewController(homeController, animated: true)
    }
    
}

extension HomeCoordinator: HomeViewControllerCoordinatorDelegate {
    
    func didSelect(_ factory: Factory) {
        let viewModel = DetailsViewModel(factory: factory)
        let detailsController = DetailsViewController(viewModel: viewModel)
        
        navigationController.pushViewController(detailsController, animated: true)
    }
    
}
