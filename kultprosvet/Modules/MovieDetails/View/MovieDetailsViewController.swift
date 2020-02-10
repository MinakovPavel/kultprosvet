//
//  MovieDetailsViewController.swift
//  kultprosvet
//
//  Created by Minakov Paul on 09/02/2020.
//  Copyright © 2020 Minakov. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tagLineLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var averageMarkLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    // MARK: Dependencies
    var output: MovieDetailsViewOutput!
    
   	// MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: Actions

}

// MARK:
extension MovieDetailsViewController: MovieDetailsViewInput {
    func setup(movie: Movie) {
        self.titleLabel.text = movie.title
        self.budgetLabel.text = "\(movie.budget)"
        self.statusLabel.text = movie.status
        self.overviewLabel.text = movie.overview
        self.tagLineLabel.text = movie.tagline
        self.averageMarkLabel.text = "\(movie.avgVote)"
        self.posterImageView.kf.setImage(with: kBaseImageURL.appendingPathComponent(movie.backdrop_path))
        
    }
    

}
