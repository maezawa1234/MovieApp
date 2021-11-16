//
//  Movie.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/16.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let overView: String
    let releaseDate: Date
    
    private enum CodingKeys: String, CodingKey {
        case title
        case overView = "over_view"
        case releaseDate = "release_date"
    }
}
