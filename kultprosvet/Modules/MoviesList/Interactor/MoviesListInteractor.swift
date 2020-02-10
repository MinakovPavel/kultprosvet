//
//  MoviesListInteractor.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import Foundation
import PromiseKit

class MoviesListInteractor {
    let apiService: Api
    
    init(apiService: Api) {
        self.apiService = apiService
    }
}

/**
 * Presenter -> Interactor
 */
extension MoviesListInteractor: MoviesListInteractorInput {
    func movies(params: [String: Any]?) -> Promise<PaginatableSearchResult<MovieMetadata>> {
        return self.apiService.movies(params: params)
    }
}
