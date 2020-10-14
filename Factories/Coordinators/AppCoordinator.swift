//
//  AppCoordinator.swift
//
//  Created by Raphael Souza on 2020-09-24.
//  Copyright © 2020 Raphael Inc. All rights reserved.
//

import UIKit

class AppCoordinator: RootViewCoordinator {
    
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []
    
    private(set) var rootViewController: UIViewController = SplashController() {
        didSet {
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                self.window.rootViewController = self.rootViewController
            })
        }
    }
    
    let window: UIWindow
    
    // MARK: - Init
    public init(window: UIWindow) {
        self.window = window
        self.window.backgroundColor = .white
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }
    
    // MARK: - Functions
    private func setCurrentCoordinator(_ coordinator: RootViewCoordinator) {
        rootViewController = coordinator.rootViewController
    }
    
    /// Starts the coordinator
    func start() {
        let homeCoordinator = HomeCoordinator()
        childCoordinators.append(homeCoordinator)
        setCurrentCoordinator(homeCoordinator)
        
        homeCoordinator.start()
    }
}
