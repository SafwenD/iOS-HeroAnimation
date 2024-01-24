//
//  MovieView.swift
//  Hero
//
//  Created by Safwen DEBBICHI on 22/01/2024.
//

import SwiftUI

struct MovieView: View {
    let movie: Movie
    @Binding var isActive: Bool
    @State private var showCloseButton: Bool = false
    let detailed: Bool
    @Namespace var namespace
    
    struct ViewConstants {
        static let maxCardHeight: CGFloat = 700
        static let detailedOffset: CGFloat = 500
        static let infosTileId = UUID().uuidString
        static let offsetDismissThreshold: CGFloat = 40
        static let minScale: CGFloat = 0.8
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                MoviePosterView(imageUrlStr: movie.image, contentMode: .fill)
                    .overlay(closeButton , alignment: .topTrailing)
                VStack(alignment: .leading, spacing: .zero) {
                    titleView()
                    infosTile()
                }.offset(y: detailed ? ViewConstants.detailedOffset : .zero)
            }
            .frame(maxWidth: .infinity, maxHeight: detailed ? .infinity : ViewConstants.maxCardHeight)
        }
        .clipShape(RoundedRectangle(cornerSize: .init(width: 24, height: 24)))
            .onAppear {
                if detailed {
                    withAnimation(.easeInOut.delay(1.0)) {
                        showCloseButton.toggle()
                    }
                }
            }
    }
    
    private func dismiss() {
        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
            self.isActive = false
        }
    }
    
    @ViewBuilder
    private var closeButton: some View {
        if showCloseButton {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 25, height: 25)
                    .padding([.top, .trailing], 25)
            })
        }
    }
    
    private func titleView() -> some View {
        Text(movie.title)
            .font(.title)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding()
    }
    
    private func infosTile() -> some View {
        VStack {
            HStack(spacing: 14) {
                Text("\(movie.rating) \(Image(systemName: "star.fill"))")
                    .bold()
                Text(movie.category)
                    .font(.caption)
                Spacer()
                Text(movie.duration)
                    .font(.caption)
            }.frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            if detailed {
                VStack {
                    Text(movie.description)
                        .font(.subheadline)
                    Spacer()
                }
                .padding()
            }
        }.background(Rectangle().foregroundStyle(.ultraThinMaterial))
    }
}
