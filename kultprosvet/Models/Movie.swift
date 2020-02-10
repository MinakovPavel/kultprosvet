//
//  Movie.swift
//  kultprosvet
//
//  Created by Mac on 10.02.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

struct Movie: Codable {

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case budget
        case overview
        case status
        case tagline
        case genres
        case avgVote = "vote_average"
        case backdrop_path
    }
    
    let id: Int
    let title: String
    let releaseDate: String
    let budget: Int
    let overview: String
    let status: String
    let tagline: String
    let backdrop_path: String
    let avgVote: Float
    let genres: [Genre]
}
