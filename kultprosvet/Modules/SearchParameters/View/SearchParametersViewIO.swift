//
//  SearchParametersViewIO.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

/**
 *  Presenter -> View
 */
protocol SearchParametersViewInput: class {
    func showKeywords(keywords: [String])
    func showGenres(genres: [String])
    func showPeople(persons: [String])
    
    func insertKeyword(with title: String)
    func insertGenre(with title: String)
    func insertPerson(with title: String)
}

/**
 * View -> Presenter
 */
protocol SearchParametersViewOutput {

  	func viewIsReady()
    
    func didRequestSearch()
    
    func didRequestSwitchAdultFlag(isOn: Bool)
        
    func didRequestSearchActor(title: String)
    
    func didRequestSearchGenre(title: String)
    
    func didEnter(title: String?)
    
    func didEnter(yearString: String?)
    
    func didSelectKeyword(at index: Int)
    
    func didSelectGenre(title: String)
    
    func didSelectPerson(at index: Int)
    
    func didRequestRemoveKeyword(index: Int)
    
    func didRequestRemoveGenre(index: Int)
    
    func didRequestRemovePerson(index: Int)

}
