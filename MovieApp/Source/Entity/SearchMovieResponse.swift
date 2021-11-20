//
//  SearchMovieResponse.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/16.
//

import Foundation

struct SearchResponse<Item: Decodable>: Decodable {
    let page: Int
    let results: [Item]
    let totalResults: Int
    let totalPages: Int
    
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
