//
//  SearchParametersInteractorInput.swift
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
protocol SearchParametersInteractorInput {
    func keywords(search: String?) -> Promise<PaginatableSearchResult<Keyword>>
    func people(search: String?) -> Promise<PaginatableSearchResult<Person>>
    func genres() -> Promise<GenresSearchResult<Genre>>
}
