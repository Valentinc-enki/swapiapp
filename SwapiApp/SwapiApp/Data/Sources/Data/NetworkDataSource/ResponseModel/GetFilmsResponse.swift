//
//  File.swift
//  
//
//  Created by Valentin COUSIEN on 11/07/2023.
//

import Foundation

public struct GetFilmsResponse: Decodable {
    public let count: Int
    public let next: String?
    public let previous: String?
    public let results: [FilmResponse]
}

extension GetFilmsResponse: Equatable {

    public static func == (lhs: GetFilmsResponse, rhs: GetFilmsResponse) -> Bool {
        return lhs.count == rhs.count &&
            lhs.next == rhs.next &&
            lhs.previous == rhs.previous &&
            lhs.results == rhs.results
    }
}
