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

