//
//  FetchFavoritesFilmsUseCase.swift
//  
//
//  Created by Valentin COUSIEN on 24/07/2023.
//

import Foundation
import Data
import Utils

public protocol FetchFavoritesFilmsUseCaseProtocol {
    
    func perform() -> [Film]
}

public struct FetchFavoritesFilmsUseCase: FetchFavoritesFilmsUseCaseProtocol {
    
    public func perform() -> [Film] {
        LocalRepository().getFavoriteFilms().toFilms()
    }
}

extension InjectedValues {
 
    private struct FetchFavoritesFilmsUseCaseKey: InjectionKey {
        
        static var currentValue: FetchFavoritesFilmsUseCaseProtocol = FetchFavoritesFilmsUseCase()
    }
    
    public var fetchFavoritesFilmsUseCase: FetchFavoritesFilmsUseCaseProtocol {
        get { Self[FetchFavoritesFilmsUseCaseKey.self] }
        set { Self[FetchFavoritesFilmsUseCaseKey.self] = newValue }
    }
}
