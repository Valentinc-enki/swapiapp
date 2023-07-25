//
//  LocalFilm.swift
//  
//
//  Created by Valentin COUSIEN on 24/07/2023.
//

import Foundation

public struct LocalFilm: Codable {

    public let id: Int
    public let title: String
    public let openingCrawl: String

    public init(id: Int, title: String, openingCrawl: String) {
        self.id = id
        self.title = title
        self.openingCrawl = openingCrawl
    }
}
