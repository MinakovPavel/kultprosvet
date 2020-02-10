//
//  MovieDetailsInteractorInput.swift
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
protocol MovieDetailsInteractorInput {
    func movies(movieId: Int) -> Promise<Movie>
}
