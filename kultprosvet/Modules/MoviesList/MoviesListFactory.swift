//
//  MoviesListFactory.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import UIKit

struct MoviesListFactory {

    private static let _shared = MoviesListFactory()

    static var shared: MoviesListFactory {
        return _shared
    }


    func createModule(filters: Filters) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: initialControllerID) as? MoviesListViewController
        let presenter = MoviesListPresenter(filters: filters)
        presenter.view = controller
        
        let interactor = MoviesListInteractor(apiService: ApiService())
        let router         = MoviesListRouter()
        presenter.router = router
        router.viewController = controller
        presenter.interactor = interactor
        controller?.output = presenter
        return controller!
    }
    
    // MARK:
    let storyboardId = "MoviesList"
    let initialControllerID = "MoviesListViewController"
}
