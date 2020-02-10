//
//  SearchParametersFactory.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import UIKit

struct SearchParametersFactory {

    private static let _shared = SearchParametersFactory()

    static var shared: SearchParametersFactory {
        return _shared
    }


    func createModule() -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardId, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: initialControllerID) as? SearchParametersViewController
        let presenter = SearchParametersPresenter()
        presenter.view = controller
        
        let interactor = SearchParametersInteractor(apiService: ApiService())
        let router         = SearchParametersRouter()
        presenter.router = router
        router.viewController = controller
        presenter.interactor = interactor
        controller?.output = presenter
        return controller!
    }
    
    // MARK:
    let storyboardId = "SearchParameters"
    let initialControllerID = "SearchParametersViewController"
}
