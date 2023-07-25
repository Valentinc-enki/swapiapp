//
//  FilmResponse.swift
//  
//
//  Created by Valentin COUSIEN on 11/07/2023.
//

import Foundation

public struct FilmResponse: Decodable {
    
    public let episodeID: Int
    public let title: String
    public let openingCrawl: String
    public let director: String
    public let producer: String
    public let releaseDate: String
    public let characters: [String]
    public let planets: [String]
    public let starships: [String]
    public let vehicles: [String]
    public let species: [String]
    public let created: String
    public let edited: String
    public let url: String

    private enum CodingKeys: String, CodingKey {
        case episodeID = "episode_id"
        case title
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
        case characters
        case planets
        case starships
        case vehicles
        case species
        case created
        case edited
        case url
    }
}

extension FilmResponse: Equatable {

    public static func == (lhs: FilmResponse, rhs: FilmResponse) -> Bool {
        return lhs.episodeID == rhs.episodeID &&
                lhs.title == rhs.title &&
                lhs.openingCrawl == rhs.openingCrawl &&
                lhs.director == rhs.director &&
                lhs.producer == rhs.producer &&
                lhs.releaseDate == rhs.releaseDate &&
                lhs.characters == rhs.characters &&
                lhs.planets == rhs.planets &&
                lhs.starships == rhs.starships &&
                lhs.vehicles == rhs.vehicles &&
                lhs.species == rhs.species &&
                lhs.created == rhs.created &&
                lhs.edited == rhs.edited &&
                lhs.url == rhs.url
    }
}
