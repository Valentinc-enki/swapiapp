//
//  File.swift
//  
//
//  Created by Valentin COUSIEN on 24/07/2023.
//

import XCTest
@testable import Data

class LocalRepositoryTests: XCTestCase {
    var localRepository: LocalRepository!

    override func setUp() {
        super.setUp()
        localRepository = LocalRepository(dataSource: MockLocalDataSource())
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSaveFavoriteFilm() {
        // Given
        let film = LocalFilm(id: 1, title: "Test Film", openingCrawl: "This is a test")

        // When
        localRepository.saveFavoriteFilm(film)

        // Then
        let savedFilms = localRepository.getFavoriteFilms()
        XCTAssertTrue(savedFilms.contains { $0.id == film.id }, "Film should be saved in favorites")
    }

    func testRemoveFavoriteFilm() {
        // Given
        let film = LocalFilm(id: 1, title: "Test Film", openingCrawl: "This is a test")
        localRepository.saveFavoriteFilm(film)

        // When
        localRepository.removeFavoriteFilm(film)

        // Then
        let savedFilms = localRepository.getFavoriteFilms()
        XCTAssertFalse(savedFilms.contains { $0.id == film.id }, "Film should be removed from favorites")
    }

    func testGetFavoriteFilms() {
        // Given
        let film1 = LocalFilm(id: 1, title: "Test Film 1", openingCrawl: "This is test 1")
        let film2 = LocalFilm(id: 2, title: "Test Film 2", openingCrawl: "This is test 2")
        let film3 = LocalFilm(id: 3, title: "Test Film 3", openingCrawl: "This is test 3")

        localRepository.saveFavoriteFilm(film1)
        localRepository.saveFavoriteFilm(film2)
        localRepository.saveFavoriteFilm(film3)

        // When
        let savedFilms = localRepository.getFavoriteFilms()

        // Then
        XCTAssertEqual(savedFilms.count, 3, "There should be 3 films in favorites")
        XCTAssertTrue(savedFilms.contains { $0.id == film1.id }, "Film 1 should be in favorites")
        XCTAssertTrue(savedFilms.contains { $0.id == film2.id }, "Film 2 should be in favorites")
        XCTAssertTrue(savedFilms.contains { $0.id == film3.id }, "Film 3 should be in favorites")
    }
}

// MockLocalDataSource class to simulate LocalDataSource for testing
class MockLocalDataSource: LocalDataSourceProtocol {

    var favoriteFilms: [LocalFilm] = []

    func saveFavoriteFilms(_ favoriteFilms: [LocalFilm]) {
        self.favoriteFilms = favoriteFilms
    }

    func saveFavoriteFilm(_ film: LocalFilm) {
        favoriteFilms.append(film)
    }

    func removeFavoriteFilm(_ film: LocalFilm) {
        favoriteFilms.removeAll { $0.id == film.id }
    }

    func getFavoriteFilms() -> [LocalFilm] {
        return favoriteFilms
    }

	func isFavorite(filmId: Int) -> Bool {
		favoriteFilms.contains { $0.id == filmId }
	}
}
