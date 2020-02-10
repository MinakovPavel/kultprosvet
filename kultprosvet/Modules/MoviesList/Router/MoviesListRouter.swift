//
//  MoviesListRouter.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import UIKit
import Foundation

class MoviesListRouter {

	weak var viewController : UIViewController?

}

extension MoviesListRouter: MoviesListRouterInput {
    func showMovieDetailsModule(id: Int) {
        let vc = MovieDetailsFactory.shared.createModule(id: id)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
