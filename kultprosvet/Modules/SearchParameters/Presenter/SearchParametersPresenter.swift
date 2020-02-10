//
//  SearchParametersPresenter.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import Foundation

class SearchParametersPresenter {

    weak var view: SearchParametersViewInput!
    var interactor: SearchParametersInteractorInput!
    var router: SearchParametersRouterInput!
    
    
    let filters = Filters()
//    var personId: Int?
//    var keywordId: Int?
//    var genreId: Int?
    
    var genres: [Genre]?
    var keywords: [Keyword]?
    var persons: [Person]?
    
    var isAdult: Bool = false
    //var year: Int?
}

// MARK: ViewOutput
extension SearchParametersPresenter: SearchParametersViewOutput {
    
    func didRequestSearchActor(title: String) {
        self.interactor.people(search: title).done { (result) in
            self.persons = result.results
            var strings = [String]()
            for person in result.results {
                strings.append(person.name)
            }
            self.view.showPeople(persons: strings)
        }.catch { (error) in
            print(error.localizedDescription)
        }
    }
    
    func didRequestSearchGenre(title: String) {
        if let genres = genres {
            var strings = [String]()
            for genre in genres {
                strings.append(genre.name)
            }
            self.view.showGenres(genres: strings)
        } else {
            self.interactor.genres().done { (result) in
                self.genres = result.genres
                var strings = [String]()
                for genre in result.genres {
                    strings.append(genre.name)
                }
                self.view.showGenres(genres: strings)
            }.catch { (error) in
                print(error.localizedDescription)
            }
        }
    }
    
    func didRequestSearch() {
        guard filters.isEmpty == false else { return }
        router.showSearchResultsModule(filters: filters)
    }
    
    func didRequestSwitchAdultFlag(isOn: Bool) {
        isAdult = isOn
    }

    func viewIsReady() {
            
    }
    
    func didEnter(title: String?) {
        self.interactor.keywords(search: title).done { (result) in
            self.keywords = result.results
            var strings = [String]()
            for person in result.results {
                strings.append(person.name)
            }
            self.view.showKeywords(keywords: strings)
        }.catch { (error) in
            print(error.localizedDescription)
        }
    }
    
    func didEnter(yearString: String?) {
        guard let year = yearString  else {
            self.filters.year = nil
            return
        }
        self.filters.year = Int(year)
    }
    
    func didSelectKeyword(at index: Int) {
        guard let keyword = keywords?[index] else { return }
        self.filters.addKeyword(id: keyword.id)
        self.view.insertKeyword(with: keyword.name)
    }
    
    func didSelectPerson(at index: Int) {
        guard let person = persons?[index] else { return }
        self.filters.addPerson(id: person.id)
        self.view.insertPerson(with: person.name)
    }
    
    func didSelectGenre(title: String) {
        guard let genres = genres else { return }
        for genre in genres where genre.name == title {
            self.filters.addGenre(id: genre.id)
            self.view.insertGenre(with: genre.name)
            break
        }
    }
    
    func didRequestRemoveKeyword(index: Int) {
        self.filters.removeKeyword(index: index)
    }
    
    func didRequestRemoveGenre(index: Int) {
        self.filters.removePerson(index: index)
    }
    
    func didRequestRemovePerson(index: Int) {
        self.filters.removeGenre(index: index)
    }

}


