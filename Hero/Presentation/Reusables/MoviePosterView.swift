//
//  MoviePosterView.swift
//  Hero
//
//  Created by Safwen DEBBICHI on 24/01/2024.
//

import SwiftUI

struct MoviePosterView: View {
    let imageUrlStr: String
    let contentMode: ContentMode?
    init(imageUrlStr: String, contentMode: ContentMode? = nil) {
        self.imageUrlStr = imageUrlStr
        self.contentMode = contentMode
    }
    var body: some View {
        AsyncImage(url: URL(string: imageUrlStr)) { image in
            if let contentMode {
                image.resizable()
                    .aspectRatio(contentMode: contentMode)
            } else {
                image.resizable()
            }
        } placeholder: {
            EmptyView()
        }
    }
}
