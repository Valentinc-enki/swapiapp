//
//  FilmListViewModel.swift
//  SwapiApp
//
//  Created by Valentin COUSIEN on 17/07/2023.
//

import Foundation
import Domain
import Utils

protocol FilmListViewModelProtocol: ObservableObject {

    var loadingState: LoadingState<[Film]> { get }
    var source: FilmSource { get }

    func onAppear()
}

final class FilmListViewModel: FilmListViewModelProtocol {

    enum Error: Swift.Error, LocalizedError {

        case fetchDataFailed

        // MARK: LocalizedError

        var errorDescription: String? {
            switch self {
            case .fetchDataFailed:
                return "API call failed"
            }
        }
    }

    @Injected(\.fetchFilmUseCase)
    private var fetchFilmsUseCase: FetchFilmsUseCaseProtocol

    @Injected(\.fetchFavoritesFilmsUseCase)
    private var fetchFavoritesFilmsUseCase: FetchFavoritesFilmsUseCaseProtocol

    @Published var loadingState: LoadingState<[Film]> = .loading

    var source: FilmSource

    init(source: FilmSource) {
        self.source = source
    }

    @MainActor
    func onAppear() {
        if source == .local {
            loadingState = .loaded(fetchFavoritesFilmsUseCase.perform())
            return
        }

        Task {
            do {
                loadingState = .loaded(try await fetchFilmsUseCase.perform())
            } catch let error {
                loadingState = .failed(error)
            }
        }
    }
}
