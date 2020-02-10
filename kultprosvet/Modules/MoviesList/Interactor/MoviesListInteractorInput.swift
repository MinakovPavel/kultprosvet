//
//  MoviesListInteractorInput.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import Foundation
import PromiseKit

/**
 * Presenter -> Interactor
 */
protocol MoviesListInteractorInput {
    func movies(params: [String: Any]?) -> Promise<PaginatableSearchResult<MovieMetadata>>
}
