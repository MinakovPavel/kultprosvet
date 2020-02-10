//
//  MovieDetailsFactory.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import UIKit

struct MovieDetailsFactory {

    private static let _shared = MovieDetailsFactory()

    static var shared: MovieDetailsFactory {
        return _shared
    }


    func createModule(id: Int) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: initialControllerID) as? MovieDetailsViewController
        let presenter = MovieDetailsPresenter(movieId: id)
        presenter.view = controller
        let interactor = MovieDetailsInteractor(apiService: ApiService())
        let router         = MovieDetailsRouter()
        presenter.router = router
        router.viewController = controller
        presenter.interactor = interactor
        controller?.output = presenter
        return controller!
    }
    
    // MARK:
    let storyboardId = "MovieDetails"
    let initialControllerID = "MovieDetailsViewController"
}
