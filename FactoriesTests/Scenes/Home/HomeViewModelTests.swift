//
//  HomeViewModelTests.swift
//  FactoriesTests
//
//  Created by Raphael Souza on 2020-10-13.
//

import XCTest
@testable import Factories

class HomeViewModelTests: XCTestCase {
    
    private var viewModel: HomeViewModel!
    
    private var pageExpectation: XCTestExpectation!
    
    private var multiplePagesExpectation: XCTestExpectation!
    
    private var itemsBeforeFetch: [Factory] = []
    
    private var testingSinglePage = true
    
    override func setUp() {
        itemsBeforeFetch = []
        let service = MockFactoriesService()
        viewModel = HomeViewModel(factoryService: service)
        viewModel.delegate = self
    }
    
    func test_page_fetch() {
        testingSinglePage = true
        pageExpectation = expectation(description: "single_page")
        viewModel.fetchPage()
        wait(for: [pageExpectation], timeout: 100)
    }
    
    /// Tests loading & appending
    func test_paginationtest_page_fetch() {
        testingSinglePage = false
        multiplePagesExpectation = expectation(description: "multiple_pages")
        
        viewModel.fetchPage()
        viewModel.fetchPage()
        
        wait(for: [multiplePagesExpectation], timeout: 100)
    }
    
}

extension HomeViewModelTests: HomeViewModelDelegate {
    
    func didFetchFactories() {
        XCTAssert(viewModel.factories != itemsBeforeFetch, "Fetching the same page")
        XCTAssert((Set(viewModel.factories) != Set(itemsBeforeFetch)) && !viewModel.hasReachedEnd, "Appending the same page to itself")
        
        if testingSinglePage {
            pageExpectation.fulfill()
        } else {
            if !itemsBeforeFetch.isEmpty {
                multiplePagesExpectation.fulfill()
            }
        }
        
        itemsBeforeFetch.append(contentsOf: viewModel.factories)
    }
    
    func didFailedFetchingFactories(with error: Error) {
        XCTAssert(false, error.localizedDescription)
    }
    
}
