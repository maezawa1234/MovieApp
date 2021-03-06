//
//  SearchMovieCellViewModel.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/21.
//

import Foundation
import SwiftUI

final class SearchMovieCellViewModel: ObservableObject {
    
    @Published private(set) var downloadData: Data?
    let title: String
    let releaseDate: String
    let originalLanguage: String
    
    init(with movie: Movie) {
        self.title = movie.title
        self.releaseDate = movie.releaseDate ?? "nil"
        self.originalLanguage = movie.originalLanguage
        guard let posterPath = movie.posterPath else { return }
        let posterImageURL = MovieAPI.imageBaseURL + posterPath
        print("url", posterImageURL)
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
