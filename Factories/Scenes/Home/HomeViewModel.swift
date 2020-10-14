//
//  HomeViewModel.swift
//  Factories
//
//  Created by Raphael Souza on 2020-10-13.
//

import Foundation

protocol HomeViewModelType: class {
    var hasReachedEnd: Bool { get }
    var factories: [Factory] { get }
    var delegate: HomeViewModelDelegate? { get set }
    
    func fetchPage()
}

protocol HomeViewModelDelegate: class {
    func didFetchFactories()
    func didFailedFetchingFactories(with error: Error)
}

class HomeViewModel: HomeViewModelType {
    
    // MARK: Attributes
    
    private let factoryService: FactoryServiceProvider
    
    private var nextPage: String?
    
    var hasReachedEnd: Bool = false
    
    var factories: [Factory] = []
    
    weak var delegate: HomeViewModelDelegate?
    
    // MARK: Lifecycle
    
    init(factoryService: FactoryServiceProvider = FactoryService()) {
        self.factoryService = factoryService
    }
    
    // MARK: Networking methods
    
    func fetchPage() {
        if hasReachedEnd && nextPage == nil {
            return
        }
        
        factoryService.fetchFactories(next: nextPage) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let page):
                self.factories.append(contentsOf: page.results)
                self.hasReachedEnd = page.next == nil
                self.nextPage = page.next
                self.delegate?.didFetchFactories()
            case .failure(let error):
                self.delegate?.didFailedFetchingFactories(with: error)
            }
        }
    }
    
}
