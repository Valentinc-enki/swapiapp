//
//  MockFilmDetailsViewModel.swift
//  SwapiApp
//
//  Created by Valentin COUSIEN on 18/07/2023.
//

import Foundation
import Domain

final class MockFilmDetailsViewModel: FilmDetailsViewModelProtocol {
    
    var film: Film
    
    init(film: Film) {
        self.film = film
    }
    
    func onFavoritesClicked() {
        if film.isFavorite {
            onRemove()
        } else {
            onSave()
        }
    }
    
    func onSave() {
        print("MockFilmDetailsViewModel, onSave")
    }
    
    func onRemove() {
        print("MockFilmDetailsViewModel, onRemove")
    }
    
}
