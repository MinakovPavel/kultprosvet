//
//  SearchParametersRouter.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import UIKit
import Foundation

class SearchParametersRouter {

	weak var viewController : UIViewController?

}

extension SearchParametersRouter: SearchParametersRouterInput {

    func showSearchResultsModule(filters: Filters) {
        let vc = MoviesListFactory.shared.createModule(filters: filters)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
