//
//  NetworkDataSourceTests.swift
//  
//
//  Created by Valentin COUSIEN on 24/07/2023.
//

import XCTest
import Foundation
@testable import Data

class NetworkDataSourceTests: XCTestCase {
    
    var dataSource: NetworkDataSource!
    
    override func setUp() {
        super.setUp()
        
        URLProtocol.registerClass(MockURLProtocol.self)
    }
    
    override func tearDown() {
        super.tearDown()
        
        dataSource = nil
        URLProtocol.unregisterClass(MockURLProtocol.self)
    }
    
    func loadJSONData(filename: String) throws -> Data {
        let testBundle = Bundle.module
        guard let url = testBundle.url(forResource: filename, withExtension: "json") else {
            throw NSError(domain: "Error loading JSON file", code: 0, userInfo: nil)
        }
        
        return try Data(contentsOf: url)
    }
    
    func testGetFilms() async throws {
        // Given
        let mockResponse = HTTPURLResponse(url: URL(string: "https://swapi.dev/api/films")!, statusCode: 200, httpVersion: "1.1", headerFields: nil)
        MockURLProtocol.mockResponse = mockResponse
        
        // Load your mock JSON data from the file and set it as mock data
        let jsonData = try loadJSONData(filename: "Mock+GetFilms")
        MockURLProtocol.mockData = jsonData

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        
        // When
        do {
            let response = try await NetworkDataSource(session: session).getFilms()
            
            // Then
            XCTAssertEqual(response.count, 2, "Expected count to be 2.")
            XCTAssertNotNil(response.results, "Results should not be nil.")
            XCTAssertEqual(response.results.count, 2, "Expected 2 film results.")
            
            // Add more assertions if needed
        } catch {
            XCTFail("Error: \(error)")
        }
    }
}
