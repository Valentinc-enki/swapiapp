//
//  FilmDetailsView.swift
//  SwapiApp
//
//  Created by Valentin COUSIEN on 18/07/2023.
//

import SwiftUI
import Domain
import EnkiDesignSystem

struct FilmDetailsView<ViewModel>: View where ViewModel: FilmDetailsViewModelProtocol {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.film.title)
                .enkiFont(.titleLarge)
                .enkiForegroundColor(.foreground(.primary))
                .multilineTextAlignment(.center)
                .padding(.top, 50)
            
            Spacer()
            
            ScrollView {
                Text(viewModel.film.openingCrawl)
                    .enkiFont(.bodyMedium)
                    .enkiForegroundColor(.foreground(.primary))
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            Spacer()
        }
    }
}

struct FilmDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FilmDetailsView(viewModel: MockFilmDetailsViewModel(film: Film.Mock.film1))
    }
}
