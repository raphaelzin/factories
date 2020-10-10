//
//  ModelParsingTests.swift
//  FactoriesTests
//
//  Created by Raphael Souza on 2020-10-10.
//

import XCTest
@testable import Factories

class ModelParsingTests: XCTestCase {

    func getMockJSON() throws -> Data {
        let path = Bundle(for: type(of: self )).path(forResource: "validResponse", ofType: "json")!
        return try Data(contentsOf: URL(fileURLWithPath: path))
    }
    
    func test_page_parsing() {
        do {
            let jsonData = try getMockJSON()
            let _ = try JSONDecoder().decode(PageResource<Factory>.self, from: jsonData)
            XCTAssert(true)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
}
