//
//  GenresSearchResult.swift
//  kultprosvet
//
//  Created by Mac on 10.02.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

struct GenresSearchResult<T: Codable>: Codable {
    let genres: [T]
}
