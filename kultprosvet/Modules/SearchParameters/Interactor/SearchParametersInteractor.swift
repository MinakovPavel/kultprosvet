//
//  SearchParametersInteractor.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import Foundation
import PromiseKit

class SearchParametersInteractor {
    var apiService: Api
    init(apiService: Api) {
        self.apiService = apiService
    }
}

/**
 * Presenter -> Interactor
 */
extension SearchParametersInteractor: SearchParametersInteractorInput {
    func keywords(search: String?) -> Promise<PaginatableSearchResult<Keyword>> {
        return self.apiService.keywords(search: search)
    }
    
    func people(search: String?) -> Promise<PaginatableSearchResult<Person>> {
        return self.apiService.people(search: search)
    }
    
    func genres() -> Promise<GenresSearchResult<Genre>> {
        return self.apiService.genres()
    }
}
