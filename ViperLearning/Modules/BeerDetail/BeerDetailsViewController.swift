//
//  BeerDetailsViewController.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit
import Nuke

class BeerDetailsViewController: UIViewController, DetailsView {
    
    var presenter: BeerDetailsPresenter!
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerTaglineLabel: UILabel!
    @IBOutlet weak var beerDescriptionTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Beer Details"
        self.preferLargeTitles()
        presenter.viewDidLoad()
    }
    
    func showDetails(forBeer beer: Beer) {
        beerNameLabel.text = beer.name
        beerTaglineLabel.text = beer.tagline
        beerDescriptionTV.text = beer.description
        guard let imageURL = beer.imageURL else { return }
        guard let url = URL(string: imageURL) else { return }
        Nuke.loadImage(with: url, into: beerImageView)
    }
}
