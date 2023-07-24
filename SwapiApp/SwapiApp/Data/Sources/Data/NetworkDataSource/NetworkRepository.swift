//
//  NetworkRepository.swift
//  
//
//  Created by Valentin COUSIEN on 11/07/2023.
//

import Foundation

public protocol NetworkRepositoryProtocol {
    
    func getFilms() async throws -> GetFilmsResponse
}

public struct NetworkRepository: NetworkRepositoryProtocol {
    
    private let dataSource: NetworkDataSource

    public init() {
        self.dataSource = NetworkDataSource()
    }
    
    init(dataSource: NetworkDataSource) {
        self.dataSource = dataSource
    }
    
    public func getFilms() async throws -> GetFilmsResponse {
        try await dataSource.getFilms()
    }
}
