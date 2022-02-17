//
//  MoviesAPI.swift
//  AvaliacaoBecaIOS
//
//  Created by Luiz Mendes Silva on 16/02/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let moviesAPI = try? newJSONDecoder().decode(MoviesAPI.self, from: jsonData)

import Foundation

// MARK: - MoviesAPI
struct MoviesAPI: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let originalTitle, posterPath: String
    let video: Bool
    let voteAverage: Double
    let overview, releaseDate: String
    let voteCount: Int
    let title: String
    let adult: Bool
    let backdropPath: String
    let originalLanguage: OriginalLanguage
    let genreIDS: [Int]
    let popularity: Double
    let mediaType: MediaType

    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case title, adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case mediaType = "media_type"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case fr = "fr"
}
