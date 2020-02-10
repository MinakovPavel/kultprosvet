//
//  MovieDetailsPresenter.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import Foundation

class MovieDetailsPresenter {

    weak var view: MovieDetailsViewInput!
    var interactor: MovieDetailsInteractorInput!
    var router: MovieDetailsRouterInput!
    let movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
    }
}

// MARK: ViewOutput
extension MovieDetailsPresenter: MovieDetailsViewOutput {

    func viewIsReady() {
        self.interactor.movies(movieId: self.movieId).done { (movie) in
            self.view.setup(movie: movie)
        }.catch { (error) in
            print(error.localizedDescription)
        }
    }

}


