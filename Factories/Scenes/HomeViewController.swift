//
//  HomeViewController.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-10.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
        
        
        let networkManager = NetworService()
        networkManager.request(PageResource<Factory>.self, endpoint: .init(method: .get, path: "")) { (result) in
            switch result {
            case .success(let page):
                print(page.results.map { $0.name })
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }

}
