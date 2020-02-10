//
//  Movie.swift
//  kultprosvet
//
//  Created by Mac on 10.02.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

struct MovieMetadata: Codable {

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
    }
    
    let id: Int
    let title: String
    let releaseDate: String
    
    var releaseYear: String {
        return String(releaseDate.prefix(4))
    }
}
