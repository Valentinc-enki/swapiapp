//
//  Film.swift
//  
//
//  Created by Valentin COUSIEN on 11/07/2023.
//

import Foundation
import Data

public struct Film {
    
    public let id: Int
    public let title: String
    public let openingCrawl: String
}

extension FilmResponse {
    
    func toFilm() -> Film {
        Film(id: episodeID, title: title, openingCrawl: openingCrawl)
    }
}

extension GetFilmsResponse {
    
    func toFilms() -> [Film] {
        results.map() { $0.toFilm() }
    }
}
