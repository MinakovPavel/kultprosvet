//
//  MoviesListViewIO.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

/**
 *  Presenter -> View
 */
protocol MoviesListViewInput: class {
    func updateData()
}

/**
 * View -> Presenter
 */
protocol MoviesListViewOutput {

  	func viewIsReady()
    
    func moviesCount() -> Int
    
    func didRequestLoadMode()
    
    func didSelectItem(at: Int)
    
    func movie(at index: Int) -> MovieMetadata?

}
