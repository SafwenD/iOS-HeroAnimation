//
//  MoviesListViewModel.swift
//  Hero
//
//  Created by Safwen DEBBICHI on 22/01/2024.
//

import SwiftUI

@MainActor
final class MoviesListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var selectedMovie: Movie?
    private let interactor: MoviesListInteractorProtocol
    
    init(interactor: MoviesListInteractorProtocol) {
        self.interactor = interactor
    }
    
    func loadMoviesList() async {
        movies = await interactor.getMoviesList()
    }
    
    func didTapOnMovie(movie: Movie) {
        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) { [weak self] in
            self?.selectedMovie = movie
        }
    }
}
