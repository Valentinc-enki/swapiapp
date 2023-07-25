//
//  LocalDataSourceTests.swift
//  
//
//  Created by Valentin COUSIEN on 24/07/2023.
//

import XCTest
@testable import Data

class LocalDataSourceTests: XCTestCase {
    
    var localDataSource: LocalDataSource!

    override func setUp() {
        super.setUp()
        
        localDataSource = LocalDataSource()
        UserDefaults.standard.removeObject(forKey: "favoriteFilms")
    }

    override func tearDown() {
        super.tearDown()
        
        UserDefaults.standard.removeObject(forKey: "favoriteFilms")
    }

    func testSaveFavoriteFilm() {
        // Given
        let film = LocalFilm(id: 1, title: "Test Film", openingCrawl: "This is a test")

        // When
        localDataSource.saveFavoriteFilm(film)

        // Then
        let savedFilms = localDataSource.getFavoriteFilms()
        XCTAssertTrue(savedFilms.contains { $0.id == film.id }, "Film should be saved in favorites")
    }

    func testRemoveFavoriteFilm() {
        // Given
        let film = LocalFilm(id: 1, title: "Test Film", openingCrawl: "This is a test")
        localDataSource.saveFavoriteFilm(film)

        // When
        localDataSource.removeFavoriteFilm(film)

        // Then
        let savedFilms = localDataSource.getFavoriteFilms()
        XCTAssertFalse(savedFilms.contains { $0.id == film.id }, "Film should be removed from favorites")
    }

    func testGetFavoriteFilms() {
        // Given
        let film1 = LocalFilm(id: 1, title: "Test Film 1", openingCrawl: "This is test 1")
        let film2 = LocalFilm(id: 2, title: "Test Film 2", openingCrawl: "This is test 2")
        let film3 = LocalFilm(id: 3, title: "Test Film 3", openingCrawl: "This is test 3")

        localDataSource.saveFavoriteFilm(film1)
        localDataSource.saveFavoriteFilm(film2)
        localDataSource.saveFavoriteFilm(film3)

        // When
        let savedFilms = localDataSource.getFavoriteFilms()

        // Then
        XCTAssertEqual(savedFilms.count, 3, "There should be 3 films in favorites")
        XCTAssertTrue(savedFilms.contains { $0.id == film1.id }, "Film 1 should be in favorites")
        XCTAssertTrue(savedFilms.contains { $0.id == film2.id }, "Film 2 should be in favorites")
        XCTAssertTrue(savedFilms.contains { $0.id == film3.id }, "Film 3 should be in favorites")
    }
}
