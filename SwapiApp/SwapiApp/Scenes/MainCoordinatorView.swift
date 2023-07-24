//
//  MainCoordinatorView.swift
//  SwapiApp
//
//  Created by Valentin COUSIEN on 24/07/2023.
//

import SwiftUI
import EnkiDesignSystem
import Domain
import NavigationBackport

struct MainCoordinatorView: View {
    
    enum Scene: NBScreen {
        case list
        case details(Film)
    }
    
    @State private var path = [MainCoordinatorView.Scene]()
    
    var body: some View {
        EnkiNavigationView(path: $path) {
            ZStack {
                FilmListView(viewModel: FilmListViewModel()) { film in
                    path.append(.details(film))
                }
            }
            .nbNavigationDestination(for: MainCoordinatorView.Scene.self) { scene in
                getSceneView(for: scene)
            }
        }
    }
    
    @ViewBuilder
    func getSceneView(for scene: MainCoordinatorView.Scene) -> some View {
        switch scene {
        case .list:
            AnyView(
                FilmListView(viewModel: FilmListViewModel()) { film in
                    path.append(.details(film))
                }
            )
        case let .details(film):
            AnyView(FilmDetailsView(viewModel: FilmDetailsViewModel(film: film)))
        }
    }
}

struct MainCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        MainCoordinatorView()
    }
}
