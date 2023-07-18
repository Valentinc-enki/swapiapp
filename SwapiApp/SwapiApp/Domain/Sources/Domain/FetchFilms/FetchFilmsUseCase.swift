//
//  File.swift
//  
//
//  Created by Valentin COUSIEN on 17/07/2023.
//

import Foundation
import Data
import Utils

public protocol FetchFilmsUseCaseProtocol {
    
    func perform() async throws -> [Film]
}

public struct FetchFilmsUseCase: FetchFilmsUseCaseProtocol {
    
    public func perform() async throws -> [Film] {
        try await NetworkRepository.getFilms().toFilms()
    }
}

extension InjectedValues {
 
    private struct FetchFilmUseCaseKey: InjectionKey {
        
        static var currentValue: FetchFilmsUseCaseProtocol = FetchFilmsUseCase()
    }
    
    public var fetchFilmUseCase: FetchFilmsUseCaseProtocol {
        get { Self[FetchFilmUseCaseKey.self] }
        set { Self[FetchFilmUseCaseKey.self] = newValue }
    }
}
