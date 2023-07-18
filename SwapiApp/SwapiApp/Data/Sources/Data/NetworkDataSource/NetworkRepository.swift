//
//  NetworkRepository.swift
//  
//
//  Created by Valentin COUSIEN on 11/07/2023.
//

import Foundation

public protocol NetworkRepositoryProtocol {
    
    static func getFilms() async throws -> GetFilmsResponse
}

public struct NetworkRepository: NetworkRepositoryProtocol {
    
    public static func getFilms() async throws -> GetFilmsResponse {
        try await NetworkDataSource()
                    .getFilms()
    }
}
