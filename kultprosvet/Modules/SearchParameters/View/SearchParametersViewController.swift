//
//  SearchParametersViewController.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import UIKit
import SearchTextField
import TagListView

class SearchParametersViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var personTagListView: TagListView!
    @IBOutlet weak var genreTagListView: TagListView!
    @IBOutlet weak var peopleTextField: SearchTextField!
    @IBOutlet weak var genresTextField: SearchTextField!
    @IBOutlet weak var titleTextField: SearchTextField!
    @IBOutlet weak var yearTextField: UITextField!
    // MARK: Dependencies
    var output: SearchParametersViewOutput!
    
   	// MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setupHandlersForTextFields()
        tagListView.delegate = self
    }

    // MARK: Actions

    @IBAction func yearTextFieldDidEndEditing(_ sender: Any) {
        output.didEnter(yearString: yearTextField.text)
    }
    
    @IBAction func titleTextFieldDidEndEditing(_ sender: Any) {
        //output.didEnter(title: titleTextField.text)
    }
    
    @IBAction func adultSwitchAction(_ sender: UISwitch) {
    }
    
    @IBAction func searchAction(_ sender: Any) {
        titleTextField.resignFirstResponder()
        output.didRequestSearch()
    }
    
    // MARK: Private
    
    private func setupHandlersForTextFields() {
        titleTextField.userStoppedTypingHandler = {
            if let criteria = self.titleTextField.text {
                if criteria.count > 1 {
                    self.titleTextField.showLoadingIndicator()
                    self.output.didEnter(title: criteria)
                }
            }
        }
        
        titleTextField.itemSelectionHandler = { filteredResults, itemPosition in
            self.titleTextField.text = ""
            self.titleTextField.resignFirstResponder()
            self.output.didSelectKeyword(at: itemPosition)
        }
        
        peopleTextField.userStoppedTypingHandler = {
            if let criteria = self.peopleTextField.text {
                if criteria.count > 1 {
                    self.peopleTextField.showLoadingIndicator()
                    self.output.didRequestSearchActor(title: criteria)
                }
            }
        }
        
        peopleTextField.itemSelectionHandler = { filteredResults, itemPosition in
            self.peopleTextField.text = ""
            self.peopleTextField.resignFirstResponder()
            self.output.didSelectPerson(at: itemPosition)
        }
        
        genresTextField.userStoppedTypingHandler = {
            if let criteria = self.genresTextField.text {
                if criteria.count > 0 {
                    self.genresTextField.showLoadingIndicator()
                    self.output.didRequestSearchGenre(title: criteria)
                }
            }
        }
        
        genresTextField.itemSelectionHandler = { filteredResults, itemPosition in
            let item = filteredResults[itemPosition]
            self.genresTextField.text = ""
            self.genresTextField.resignFirstResponder()
            self.output.didSelectGenre(title: item.title)
        }
    }
}

// MARK:
extension SearchParametersViewController: SearchParametersViewInput {
    
    func insertKeyword(with title: String) {
        tagListView.addTag(title)
    }
    
    func insertGenre(with title: String) {
        genreTagListView.addTag(title)
    }
    
    func insertPerson(with title: String) {
        personTagListView.addTag(title)
    }
    
    func showKeywords(keywords: [String]) {
        self.titleTextField.stopLoadingIndicator()
        self.titleTextField.filterStrings(keywords)
    }
    
    func showGenres(genres: [String]) {
        self.genresTextField.stopLoadingIndicator()
        self.genresTextField.filterStrings(genres)
    }
    
    func showPeople(persons: [String]) {
        self.peopleTextField.stopLoadingIndicator()
        self.peopleTextField.filterStrings(persons)
    }

}

extension SearchParametersViewController: TagListViewDelegate {
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        guard let index = sender.tagViews.firstIndex(of: tagView) else { return }
        if sender == tagListView {
            output.didRequestRemoveKeyword(index: index)
        } else if sender == personTagListView {
            output.didRequestRemovePerson(index: index)
        } else if sender == genreTagListView {
            output.didRequestRemoveGenre(index: index)
        }
        sender.removeTagView(tagView)
    }
}

