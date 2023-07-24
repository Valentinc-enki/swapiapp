//
//  LocalRepository.swift
//  
//
//  Created by Valentin COUSIEN on 24/07/2023.
//

import Foundation

public struct LocalRepository {
    
    private let dataSource: LocalDataSource

    public init() {
        self.dataSource = LocalDataSource()
    }
    
    init(dataSource: LocalDataSource) {
        self.dataSource = dataSource
    }

    public func saveFavoriteFilm(_ film: LocalFilm) {
        dataSource.saveFavoriteFilm(film)
    }

    public func removeFavoriteFilm(_ film: LocalFilm) {
        dataSource.removeFavoriteFilm(film)
    }

    public func getFavoriteFilms() -> [LocalFilm] {
        return dataSource.getFavoriteFilms()
    }
}
