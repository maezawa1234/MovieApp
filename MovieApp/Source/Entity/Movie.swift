//
//  Movie.swift
//  MovieApp
//
//  Created by 前澤健一 on 2021/11/16.
//

import Foundation

struct Movie: Decodable, Identifiable {
    
    // MARK: - Property
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String?
    let posterPath: String?
    let originalTitle: String
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let originalLanguage: String
    let popularity: Float
    let video: Bool
    let voteAverage: Float
    let voteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case id, title, overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case popularity, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension Movie {
    static let mock = Movie(id: 58,
                            title: "パイレーツ・オブ・カリビアン／生命の泉",
                            overview: "This is overview of this movie and about details ...",
                            releaseDate: "2021-12-11",
                            posterPath: "/bfTKq6mGHt2CzZlBU31JHF9bMog.jpg",
                            originalTitle: "Original Title",
                            adult: true,
                            backdropPath: "back/drop/path.jpg",
                            genreIds: [1, 2, 3],
                            originalLanguage: "en",
                            popularity: 3.33,
                            video: true,
                            voteAverage: 4.44,
                            voteCount: 594)
}
