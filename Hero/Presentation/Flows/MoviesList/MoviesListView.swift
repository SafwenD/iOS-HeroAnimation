//
//  MoviesListView.swift
//  Hero
//
//  Created by Safwen DEBBICHI on 22/01/2024.
//

import SwiftUI

struct MoviesListView: View {
    @StateObject var viewModel: MoviesListViewModel
    @State var scale: CGFloat = 1.0
    @Namespace var namespace
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.movies, id: \.id) { movie in
                    Button(action: {
                        viewModel.didTapOnMovie(movie: movie)
                    }, label: {
                        movieCardView(movie: movie)
                            .matchedGeometryEffect(id: movie.id, in: namespace)
                    }).buttonStyle(ScaleButtonStyle())
                }
            }.scrollIndicators(.hidden)
            .navigationTitle("Featured")
            .navigationBarTitleDisplayMode(.large)
            
        }
        .modal(bindable: $viewModel.selectedMovie, destination: { movie in
            movieCardView(movie: movie)
                .matchedGeometryEffect(id: movie.id, in: namespace)
                
        })
        .task {
            await viewModel.loadMoviesList()
        }
    }
    
    private func movieCardView(movie: Movie) -> some View {
        MovieView(movie: movie, isActive: $viewModel.selectedMovie.toBoolBinding, detailed: viewModel.selectedMovie?.id == movie.id)
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

#Preview {
    MoviesListView(viewModel: MoviesListViewModel(interactor: MoviesListInteractor()))
}
