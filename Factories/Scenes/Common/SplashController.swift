//
//  SplashViewController.swift
//
//  Created by Raphael Souza on 2020-09-24.
//  Copyright © 2020 Raphael Inc. All rights reserved.
//

import UIKit

class SplashController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Environment.getValue(forKey: .appName)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 28)
        return label
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.color = .lightGray
        return ai
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SplashController {
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureLayout() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16)
            ])
        
        activityIndicator.startAnimating()
    }
}
