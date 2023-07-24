//
//  RemoveFavoritesFilmsUseCase.swift
//  
//
//  Created by Valentin COUSIEN on 24/07/2023.
//

import Foundation
import Data
import Utils

public protocol RemoveFavoritesFilmsUseCaseProtocol {
    
    func perform(film: Film)
}

public struct RemoveFavoritesFilmsUseCase: RemoveFavoritesFilmsUseCaseProtocol {
    
    public func perform(film: Film) {
        LocalRepository().removeFavoriteFilm(film.toLocalFilm())
    }
}

extension InjectedValues {
 
    private struct RemoveFavoritesFilmsUseCaseKey: InjectionKey {
        
        static var currentValue: RemoveFavoritesFilmsUseCaseProtocol = RemoveFavoritesFilmsUseCase()
    }
    
    public var removeFavoritesFilmsUseCase: RemoveFavoritesFilmsUseCaseProtocol {
        get { Self[RemoveFavoritesFilmsUseCaseKey.self] }
        set { Self[RemoveFavoritesFilmsUseCaseKey.self] = newValue }
    }
}
