//
//  MoviesListInteractor.swift
//  Hero
//
//  Created by Safwen DEBBICHI on 22/01/2024.
//

import Foundation

protocol MoviesListInteractorProtocol {
    func getMoviesList() async -> [Movie]
}

final class MoviesListInteractor: MoviesListInteractorProtocol {
    func getMoviesList() async -> [Movie] {
        var movies: [Movie] = []
        movies.append(.init(title: "Role Play (2023)", image: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/nAdbrQvzIlqGTmod9kgsbKeCLAV.jpg", duration: "1h 41m", category: "Action, Comedy, Romance", rating: "5", description: "Emma has a wonderful husband and two kids in the suburbs of New Jersey – she also has a secret life as an assassin for hire – a secret that her husband David discovers when the couple decide to spice up their marriage with a little role play."))
        movies.append(.init(title: "John Wick: Chapter 4 (2023)", image: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg", duration: "2h 50m", category: "Action, Thriller, Crime", rating: "7.8", description: "With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes."))
        movies.append(.init(title: "Reacher (2022)", image: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/jFuH0md41x5mB4qj5344mSmtHrO.jpg", duration: "1h 52m", category: "Action & Adventure, Crime, Drama", rating: "8.1", description: "Jack Reacher, a veteran military police investigator, has just recently entered civilian life. Reacher is a drifter, carrying no phone and the barest of essentials as he travels the country and explores the nation he once served."))
        return movies
    }
}
