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

    @StateObject var viewModel: ViewModel
    
    var body: some View {
        EnkiNavigationView {
            switch viewModel.loadingState {
            case let .loaded(films):
                loadedView(films: films)
            case .loading:
                ProgressView()
            case .failed:
                Image(systemName: "exclamationmark.circle.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.red)
                Text("Request Failed")
                    .font(.headline)
                    .foregroundColor(.red)
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
                SwiftUI.Button {
                    print("didClick on \(film.title)")
                } label: {
                    RightChevronCell {
                        LabelCell(label: "\(film.id). \(film.title)")
                    }
                }
            }
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
