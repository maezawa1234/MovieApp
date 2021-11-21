//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/21.
//

import Foundation
import SwiftUI

final class MovieDetailViewModel: ObservableObject {
    
    @Published private(set) var downloadData: Data?
    let movie: Movie
    
    init(with movie: Movie) {
        self.movie = movie
        guard let posterPath = movie.posterPath else { return }
        let posterImageURL = MovieAPI.imageBaseURL + posterPath
        self.downloadImageAsync(url: posterImageURL)
    }

    private func downloadImageAsync(url: String) {
        guard let imageURL = URL(string: url) else {
            return
        }
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.downloadData = data
            }
        }
    }
}
