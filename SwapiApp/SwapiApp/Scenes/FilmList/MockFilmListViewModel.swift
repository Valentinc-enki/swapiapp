//
//  MockFilmListViewModel.swift
//  SwapiApp
//
//  Created by Valentin COUSIEN on 17/07/2023.
//

import Foundation
import Domain
import Utils

final class MockFilmListViewModel: FilmListViewModelProtocol {
    
    var selectedFilm: Film?
    var loadingState: LoadingState<[Film]> = .loading
    
    init(filmsCards: [Film]) {
        self.loadingState = .loaded(filmsCards)
    }
    
    func onAppear() { }
}
