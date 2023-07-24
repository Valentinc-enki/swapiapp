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
import NavigationBackport

struct FilmListView<ViewModel>: View where ViewModel: FilmListViewModelProtocol {
    
    @StateObject private var viewModel: ViewModel
    
    var onFilmSelected: (Film) -> Void
    
    var body: some View {
        EnkiNavigationView {
            switch viewModel.loadingState {
            case let .loaded(films):
                loadedView(films: films)
            case .loading:
                Spinner()
            case .failed:
                errorView()
            }
        }
        .onAppear() {
            viewModel.onAppear()
        }
    }
    
    // MARK: Init
    
    init(viewModel: ViewModel,
         onFilmSelected: @escaping (Film) -> Void) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.onFilmSelected = onFilmSelected
    }
    
    func loadedView(films: [Film]) -> some View {
        EnkiList {
            ForEach(films, id: \.id) { film in
                Button {
                    onFilmSelected(film)
                } label: {
                    RightChevronCell {
                        LabelCell(label: "\(film.id). \(film.title)")
                    }
                }
            }
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
        EnkiNavigationView {
            FilmListView(viewModel: MockFilmListViewModel(filmsCards: [Film.Mock.film1,
                                                                       Film.Mock.film2,
                                                                       Film.Mock.film3])) {
                film in
                print("\(film.title) selected")
            }
        }
    }
}

#endif
