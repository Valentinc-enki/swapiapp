//
//  SaveFavoritesFilmsUseCase.swift
//  
//
//  Created by Valentin COUSIEN on 24/07/2023.
//

import Foundation
import Data
import Utils

public protocol SaveFavoritesFilmsUseCaseProtocol {
    
    func perform(film: Film)
}

public struct SaveFavoritesFilmsUseCase: SaveFavoritesFilmsUseCaseProtocol {
    
    public func perform(film: Film) {
        LocalRepository().saveFavoriteFilm(film.toLocalFilm())
    }
}

extension InjectedValues {
 
    private struct SaveFavoritesFilmsUseCaseKey: InjectionKey {
        
        static var currentValue: SaveFavoritesFilmsUseCaseProtocol = SaveFavoritesFilmsUseCase()
    }
    
    public var saveFavoritesFilmsUseCase: SaveFavoritesFilmsUseCaseProtocol {
        get { Self[SaveFavoritesFilmsUseCaseKey.self] }
        set { Self[SaveFavoritesFilmsUseCaseKey.self] = newValue }
    }
}
