//
//  FactoryServiceTests.swift
//  FactoriesTests
//
//  Created by Raphael Souza on 2020-10-14.
//

import XCTest
@testable import Factories

class FactoryServiceTests: XCTestCase {
    
    var factoryService: FactoryService!
    
    override func setUp() {
        factoryService = FactoryService(networkManager: MockNetworkService())
    }
    
    func test_empty_offset_page_fetch() {
        factoryService.fetchFactories(offset: nil) { (result) in
            switch result {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .success(let page):
                XCTAssert(!page.results.isEmpty)
            }
        }
    }
    
    func test_invalid_offset() {
        factoryService.fetchFactories(offset: "-10") { (result) in
            switch result {
            case .failure(let error):
                // TODO: Should specify error == invalid offset
                XCTAssertTrue(true, error.localizedDescription)
            case .success:
                XCTFail("An invalid offset was provided, this should produce an error")
            }
        }
    }
    
}
