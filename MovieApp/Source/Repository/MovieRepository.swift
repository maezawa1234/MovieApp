//
//  MovieRepository.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/16.
//

import Foundation
import Combine
import SwiftUI
import APIKit

protocol MovieRepositoryProtocol {
    func searchMovies(query: String) -> Future<SearchResponse<Movie>, Error>
}

final class MovieRepository: MovieRepositoryProtocol {
    func searchMovies(query: String) -> Future<SearchResponse<Movie>, Error> {
        let request = MovieAPI.SearchMovieRequest(query: query)
        print(try! request.buildURLRequest())
        return Future<SearchResponse<Movie>, Error> { promiss in
            Session.send(request) { result in
                switch result {
                case .success(let response):
                    promiss(.success(response))
                case .failure(let error):
                    promiss(.failure(error))
                }
            }
        }
        
    }
}
            
