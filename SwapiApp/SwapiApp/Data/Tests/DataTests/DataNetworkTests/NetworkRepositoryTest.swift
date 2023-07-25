//
//  DataNetworkRepository.swift
//  
//
//  Created by Valentin COUSIEN on 24/07/2023.
//

import XCTest
@testable import Data

let mockFilmResponse1 = FilmResponse(
    episodeID: 7,
    title: "The Code Awakens",
    openingCrawl: "The AI galaxy is in turmoil...",
    director: "J.J. Algorithm",
    producer: "Binary Bros",
    releaseDate: "2024-03-12",
    characters: ["Rey Circuitwalker", "Finntron", "BB-88"],
    planets: ["CPU-7", "Digitalis", "Transistoria"],
    starships: ["Falcon-X1", "Neural Star", "Starshuttle X"],
    vehicles: ["Turing Speeder", "Quantum Quad", "Logic Swoop"],
    species: ["Robo-Humanoid", "Electro-Gremlin", "Bitonian"],
    created: "2024-03-10T16:45:00Z",
    edited: "2024-03-12T09:20:00Z",
    url: "https://example.com/films/7"
)

let mockFilmResponse2 = FilmResponse(
    episodeID: 10,
    title: "The Last Programmer",
    openingCrawl: "The final showdown is near...",
    director: "Sofia Syntax",
    producer: "AI Motion Pictures",
    releaseDate: "2025-11-28",
    characters: ["Kylo Code", "General Binary", "Poe Algorithma"],
    planets: ["Algoth", "Paradigmus", "Kernelon"],
    starships: ["Supreme Algorithm", "Dark Compiler", "Resistor Cruiser"],
    vehicles: ["Syntax Speedster", "Loopy Loop", "Quantum Cycle"],
    species: ["Meta-Human", "AI-Enhanced", "Quantum Entity"],
    created: "2025-11-25T14:10:00Z",
    edited: "2025-11-28T08:05:00Z",
    url: "https://example.com/films/10"
)

// Mock NetworkDataSource for testing
class MockNetworkDataSource: NetworkDataSourceProtocol {
    
    var filmResponse: GetFilmsResponse?
    
    func getFilms() async throws -> GetFilmsResponse {
        filmResponse ?? GetFilmsResponse(count: 0, next: nil, previous: nil, results: [])
    }
}

class NetworkRepositoryTests: XCTestCase {
    
    var sut: NetworkRepository!
    var mockDataSource: MockNetworkDataSource!
    
    override func setUp() {
        super.setUp()
        mockDataSource = MockNetworkDataSource()
        sut = NetworkRepository(dataSource: mockDataSource)
    }
    
    override func tearDown() {
        sut = nil
        mockDataSource = nil
        super.tearDown()
    }
    
    // Test the success case of getFilms()
    func testGetFilmsSuccess() async throws {
        let expectedResponse = GetFilmsResponse(count: 2,
                                                next: nil,
                                                previous: nil,
                                                results: [mockFilmResponse1, mockFilmResponse2])
        mockDataSource.filmResponse = expectedResponse
        
        // Call the method under test
        let response = try await sut.getFilms()
        
        // Verify the result
        XCTAssertEqual(response, expectedResponse)
    }
}

