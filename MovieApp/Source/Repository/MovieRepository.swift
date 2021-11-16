//
//  MovieRepository.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/16.
//

import Foundation

protocol MovieRepositoryProtocol {
    func searchMovies(query: String)
}

final class MovieRepository: MovieRepositoryProtocol {
    func searchMovies(query: String) {
        let request = MovieAPI.SearchMovieRequest(query: query)
    }
}
            
