//
//  SwapiApp.swift
//  SwapiApp
//
//  Created by Valentin COUSIEN on 11/07/2023.
//

import EnkiDesignSystem
import SwiftUI

@main
struct SwapiApp: App {

    var body: some Scene {
        WindowGroup {
            FilmListView(viewModel: FilmListViewModel())
        }
    }
}
