//
//  LocalRepository.swift
//  
//
//  Created by Valentin COUSIEN on 24/07/2023.
//

import Foundation

protocol LocalRepositoryProtocol {
	func saveFavoriteFilm(_ film: LocalFilm)
	func removeFavoriteFilm(_ film: LocalFilm)
	func getFavoriteFilms() -> [LocalFilm]
	func isFavorite(filmId: Int) -> Bool
}

public struct LocalRepository: LocalRepositoryProtocol {

	private let dataSource: LocalDataSourceProtocol

	public init() {
		self.dataSource = LocalDataSource()
	}

	init(dataSource: LocalDataSourceProtocol) {
		self.dataSource = dataSource
	}

	public func saveFavoriteFilm(_ film: LocalFilm) {
		dataSource.saveFavoriteFilm(film)
	}

	public func removeFavoriteFilm(_ film: LocalFilm) {
		dataSource.removeFavoriteFilm(film)
	}

	public func getFavoriteFilms() -> [LocalFilm] {
		dataSource.getFavoriteFilms()
	}

	public func isFavorite(filmId: Int) -> Bool {
		dataSource.isFavorite(filmId: filmId)
	}
}
