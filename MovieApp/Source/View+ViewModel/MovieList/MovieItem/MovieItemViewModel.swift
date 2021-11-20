//
//  MovieItemViewModel.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/21.
//

import SwiftUI

final class MovieItemViewModel: ObservableObject {
    @Published var downloadData: Data? = nil
    let title: String
    private let url: String
    
    init(movie: Movie) {
        self.title = movie.title
        guard let posterPath = movie.posterPath else {
            self.url = ""
            return
        }
        self.url = MovieAPI.imageBaseURL + posterPath
        self.downloadImageAsync(url: self.url)
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
