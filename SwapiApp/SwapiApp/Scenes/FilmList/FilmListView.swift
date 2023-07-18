//
//  FilmListView.swift
//  SwapiApp
//
//  Created by Valentin COUSIEN on 11/07/2023.
//

import SwiftUI
import Domain
import EnkiDesignSystem
import Utils

struct FilmListView<ViewModel>: View where ViewModel: FilmListViewModelProtocol {
    
    @StateObject private var viewModel: ViewModel
    
    @State private var path = NavigationPath()
    
    var body: some View {
        EnkiNavigationView {
            switch viewModel.loadingState {
            case let .loaded(films):
                loadedView(films: films)
            case .loading:
                ProgressView()
            case .failed:
                errorView()
            }
        }.onAppear() {
            viewModel.onAppear()
        }
    }
    
    // MARK: Init
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    func loadedView(films: [Film]) -> some View {
        EnkiList {
            ForEach(films, id: \.id) { film in
                Button {
                    path.append(film)
                } label: {
                    RightChevronCell {
                        LabelCell(label: "\(film.id). \(film.title)")
                    }
                }
            }
        }
        .navigationDestination(for: Film.self) { film in
            let detailsViewModel = FilmDetailsViewModel(film: film)
            FilmDetailsView(viewModel: detailsViewModel)
        }
    }
    
    func errorView() -> some View {
        VStack {
            Image(systemName: "exclamationmark.circle.fill")
                .font(.system(size: 64))
                .foregroundColor(.red)
            Text("Request Failed")
                .font(.headline)
                .foregroundColor(.red)
        }
    }
}

#if DEBUG

struct FilmListView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView(viewModel: MockFilmListViewModel(filmsCards: [Film.Mock.film1,
                                                                   Film.Mock.film2,
                                                                   Film.Mock.film3]))
    }
}

#endif
