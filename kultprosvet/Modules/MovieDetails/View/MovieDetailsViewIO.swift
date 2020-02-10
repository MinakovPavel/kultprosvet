//
//  MovieDetailsViewIO.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

/**
 *  Presenter -> View
 */
protocol MovieDetailsViewInput: class {
    func setup(movie: Movie)
}

/**
 * View -> Presenter
 */
protocol MovieDetailsViewOutput {

  	func viewIsReady()

}
