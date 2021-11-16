//
//  SearchMovieResponse.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/16.
//

import Foundation

struct SearchResponse<Item: Decodable>: Decodable {
    let page: Int
    let items: [Item]
}
