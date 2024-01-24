//
//  MoviesModel.swift
//  Hero
//
//  Created by Safwen DEBBICHI on 22/01/2024.
//

import Foundation

struct Movie: Identifiable {
    let id: UUID = UUID()
    let title, image, duration, category, rating, description: String
}
