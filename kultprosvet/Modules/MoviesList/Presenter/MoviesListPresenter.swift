//
//  MoviesListPresenter.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import Foundation

class MoviesListPresenter {

    weak var view: MoviesListViewInput!
    var interactor: MoviesListInteractorInput!
    var router: MoviesListRouterInput!
    var searchResult = [MovieMetadata]() {
        didSet {
            self.view.updateData()
        }
    }
    
    fileprivate var isLoading = false
    
    fileprivate var canLoadingMore = true
    
    fileprivate var pageToLoad = 1
    
    let filters: Filters
    
    init(filters: Filters) {
        self.filters = filters
    }
    
    private func load() {
        guard isLoading == false else { return }
        guard canLoadingMore == true else { return }
        isLoading = true
        var params = filters.parameters
        params["page"] = pageToLoad
        self.interactor.movies(params: params).done { (result) in
            self.searchResult.append(contentsOf: result.results)
            self.canLoadingMore = result.page != result.totalPages
            self.pageToLoad += 1
        }.catch { (error) in
            print(error.localizedDescription)
        }.finally {
            self.isLoading = false
        }
    }
}

// MARK: ViewOutput
extension MoviesListPresenter: MoviesListViewOutput {
    
    func movie(at index: Int) -> MovieMetadata? {
        return searchResult[index]
    }
    
    func moviesCount() -> Int {
        return searchResult.count
    }
    
    func didRequestLoadMode() {
        load()
    }
    
    func didSelectItem(at: Int) {
        router.showMovieDetailsModule(id: searchResult[at].id)
    }
    

    func viewIsReady() {
        load()
    }

}
