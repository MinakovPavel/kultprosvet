//
//  PaginatableSearchResult.swift
//  kultprosvet
//
//  Created by Mac on 10.02.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

struct PaginatableSearchResult<T: Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [T]
}
