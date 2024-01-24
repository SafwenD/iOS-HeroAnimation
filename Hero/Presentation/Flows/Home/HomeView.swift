//
//  HomeView.swift
//  Hero
//
//  Created by Safwen DEBBICHI on 23/01/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        MoviesListView(viewModel: MoviesListViewModel(interactor: MoviesListInteractor()))
            .preferredColorScheme(.dark)
    }
}

#Preview {
    HomeView()
}
