//
//  ApiService.swift
//  kultprosvet
//
//  Created by Mac on 10.02.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import PromiseKit

let kBaseImageURL = URL(string: "https://image.tmdb.org/t/p/w500")! // WARNING : Need to get this url from GET /configurations

protocol Api {
    func movies(movieId: Int) -> Promise<Movie>
    func movies(params: [String: Any]?) -> Promise<PaginatableSearchResult<MovieMetadata>>
    func people(search: String?) -> Promise<PaginatableSearchResult<Person>>
    func genres() -> Promise<GenresSearchResult<Genre>>
    func keywords(search: String?) -> Promise<PaginatableSearchResult<Keyword>>
}

// MARK: - API implementation

class ApiService {

    private let baseUrl = URL(string: "https://api.themoviedb.org/3/")!
    
    private let apiKey = "8123971648da4ff0ca36b9fed8f72ebd"
    
    private func request<T>(path: String, params: [String: Any]?) -> Promise<T> where T: Decodable {
        var parameters: [String: Any] = ["api_key": apiKey]
        if let params = params {
            parameters.merge(params) { (lhs, rhs) -> Any in
                return lhs
            }
        }
        
        return
            Alamofire
                .request(baseUrl.appendingPathComponent(path), method: .get, parameters: parameters)
                .responseDecodable(T.self)
    }
}

extension ApiService: Api {

    func movies(movieId: Int) -> Promise<Movie> {
        return self.request(path: "movie/\(movieId)", params: nil)
    }
    
    func movies(params: [String: Any]?) -> Promise<PaginatableSearchResult<MovieMetadata>> {
        return self.request(path: "discover/movie", params: params)
    }
    
    func people(search: String?) -> Promise<PaginatableSearchResult<Person>> {
        return self.request(path: "search/person", params: ["query": search!])
    }
    
    func keywords(search: String?) -> Promise<PaginatableSearchResult<Keyword>> {
        return self.request(path: "search/keyword", params: ["query": search!])
    }
    
    func genres() -> Promise<GenresSearchResult<Genre>> {
        return self.request(path: "genre/movie/list", params: nil)
    }
}
