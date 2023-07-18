//
//  MockFilmDetailsViewModel.swift
//  SwapiApp
//
//  Created by Valentin COUSIEN on 18/07/2023.
//

import Foundation
import Domain

class MockFilmDetailsViewModel: FilmDetailsViewModelProtocol {
    
    var film: Film
    
    init(film: Film) {
        self.film = film
    }
}
