//
//  FilmDetailsViewModel.swift
//  SwapiApp
//
//  Created by Valentin COUSIEN on 18/07/2023.
//

import Foundation
import Domain

protocol FilmDetailsViewModelProtocol: ObservableObject {
    
    var film: Film { get }
}

class FilmDetailsViewModel: FilmDetailsViewModelProtocol {
    
    @Published var film: Film
    
    init(film: Film) {
        self.film = film
    }
}
