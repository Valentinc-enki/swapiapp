//
//  FilmDetailsViewModel.swift
//  SwapiApp
//
//  Created by Valentin COUSIEN on 18/07/2023.
//

import Foundation
import Domain
import Utils

protocol FilmDetailsViewModelProtocol: ObservableObject {
    
    var film: Film { get }
    
    func onFavoritesClicked()
}

class FilmDetailsViewModel: FilmDetailsViewModelProtocol {
    
    @Published var film: Film
    
    @Injected(\.saveFavoritesFilmsUseCase)
    private var saveFavoritesFilmsUseCase: SaveFavoritesFilmsUseCaseProtocol
    
    @Injected(\.removeFavoritesFilmsUseCase)
    private var removeFavoritesFilmsUseCase: RemoveFavoritesFilmsUseCaseProtocol
    
    
    init(film: Film) {
        self.film = film
    }
    
    func onFavoritesClicked() {
        if film.isFavorite {
            removeFavoritesFilmsUseCase.perform(film: film)
        } else {
            saveFavoritesFilmsUseCase.perform(film: film)
        }
        
        film.isFavorite.toggle()
    }
}
