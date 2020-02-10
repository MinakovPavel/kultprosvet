//
//  MoviesListViewController.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import UIKit

fileprivate let kCellIdentifier = "cell"

class MoviesListViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var tableView: UITableView!
    // MARK: Dependencies
    var output: MoviesListViewOutput!
    
   	// MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: Actions

}

// MARK:
extension MoviesListViewController: MoviesListViewInput {
    func updateData() {
        self.tableView.reloadData()
    }
}

extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.moviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath)
        let movie = output.movie(at: indexPath.row)
        cell.textLabel?.text = movie?.title
        cell.detailTextLabel?.text = movie?.releaseYear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectItem(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == output.moviesCount() - 1 {
            output.didRequestLoadMode()
        }
    }
}
