//
//  Film.swift
//  
//
//  Created by Valentin COUSIEN on 11/07/2023.
//

import Foundation
import Data

public struct Film: Hashable {
    public let id: Int
    public let title: String
    public let openingCrawl: String
    public var isFavorite: Bool
}

extension FilmResponse {
    func toFilm() -> Film {
        Film(id: episodeID,
             title: title,
             openingCrawl: openingCrawl,
             isFavorite: LocalRepository().isFavorite(filmId: episodeID))
    }
}

extension GetFilmsResponse {
    func toFilms() -> [Film] {
        results.map { $0.toFilm() }
    }
}

extension LocalFilm {
    func toFilm() -> Film {
        Film(id: id, title: title, openingCrawl: openingCrawl, isFavorite: true)
    }
}

extension Array where Element == LocalFilm {
    func toFilms() -> [Film] {
        self.map { $0.toFilm() }
    }
}

extension Film {
    func toLocalFilm() -> LocalFilm {
        LocalFilm(id: id, title: title, openingCrawl: openingCrawl)
    }
}
