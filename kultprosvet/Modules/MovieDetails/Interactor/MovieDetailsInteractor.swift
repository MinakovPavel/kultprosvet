//
//  MovieDetailsInteractor.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import Foundation
import PromiseKit

class MovieDetailsInteractor {
    let apiService: Api
    
    init(apiService: Api) {
        self.apiService = apiService
    }
}

/**
 * Presenter -> Interactor
 */
extension MovieDetailsInteractor: MovieDetailsInteractorInput {
    func movies(movieId: Int) -> Promise<Movie> {
        return self.apiService.movies(movieId: movieId)
    }
}
