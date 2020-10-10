//
//  RootViewCoordinator.swift
//
//  Created by Raphael Souza on 2020-09-24.
//  Copyright © 2020 Raphael Inc. All rights reserved.
//

import UIKit

public protocol RootViewControllerProvider: class {
    // The coordinators 'rootViewController'. It helps to think of this as the view
    // controller that can be used to dismiss the coordinator from the view hierarchy.
    var rootViewController: UIViewController { get }
    func start()
}

/// A Coordinator type that provides a root UIViewController
public typealias RootViewCoordinator = Coordinator & RootViewControllerProvider
