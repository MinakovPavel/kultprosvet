//
//  Filters.swift
//  kultprosvet
//
//  Created by Mac on 11.02.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

fileprivate enum Constants: String {
    typealias RawValue = String
    
    case year
    case withKeywords = "with_keywords"
    case withPeople = "with_people"
    case withGenres = "with_genres"
    case isAdult = "include_adult"
}

class Filters {
    
    var year: Int?
    var keywords = [Int]()
    var genres = [Int]()
    var persons = [Int]()
    var isAdult: Bool = false
    
    var parameters: [String: Any] {
        var result = [String: Any]()
        if let year = year {
            result[Constants.year.rawValue] = year
        }
        result[Constants.withKeywords.rawValue] = (keywords.map{String($0)}).joined(separator: ",")
        result[Constants.withPeople.rawValue] = (persons.map{String($0)}).joined(separator: ",")
        result[Constants.withGenres.rawValue] = (genres.map{String($0)}).joined(separator: ",")
        result[Constants.isAdult.rawValue] = isAdult
        
        return result
    }
    
    var isEmpty: Bool {
        return (year == nil && keywords.isEmpty && genres.isEmpty && persons.isEmpty)
    }
    
    
    func addKeyword(id: Int) {
        if keywords.contains(id) == false {
            keywords.append(id)
        }
    }
    
    func addPerson(id: Int) {
        if persons.contains(id) == false {
            persons.append(id)
        }
    }
    
    func addGenre(id: Int) {
        if genres.contains(id) == false {
            genres.append(id)
        }
    }
    
    func removeKeyword(index: Int) {
        keywords.remove(at: index)
    }
    
    func removePerson(index: Int) {
        persons.remove(at: index)
    }
    
    func removeGenre(index: Int) {
        genres.remove(at: index)
    }
}
