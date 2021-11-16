//
//  MovieAPI.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/16.
//

import Foundation
import APIKit

struct MovieAPI {}

// MARK: - APIKey
extension MovieAPI {
    static let apiKey = "588b98b3ff1aba3d048b6a3152061a68"
}

// MARK: - Request
extension MovieAPI {
    
    // MARK: - SearchMovieRequest
    struct SearchMovieRequest: MovieRequestType {
        typealias Response = SearchResponse<Movie>
        
        let method: HTTPMethod = .get
        let path: String = "search/movie"
        
        // MARK: - Queries
        let language = "en-US"
        let query: String
        let includeAdult = true
        
        var parameters: Any? {
            guard !MovieAPI.apiKey.isEmpty else {
                fatalError("api_keyが設定されていません.\nMovie.apiKey")
            }
            return [
                "api_key": MovieAPI.apiKey,
                "language": language,
                "query": query,
                "include_adult": includeAdult
            ]
        }
    }
}
