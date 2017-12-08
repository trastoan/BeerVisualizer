//
//  BeerCell.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit
import Kingfisher

class BeerCell: UITableViewCell {
    @IBOutlet weak var beerImage: LoadableImageView!
    @IBOutlet weak var beerTitleLabel: UILabel!
    @IBOutlet weak var beerTagline: UILabel!
    
    //Setup cell UI elements with Beer object
    func setup(_ beer: Beer) {
        self.accessoryType = .disclosureIndicator
        beerTitleLabel.text = beer.name
        beerTagline.text = beer.tagline
        guard let urlString = beer.imageURL else { return }
        guard let url = URL(string: urlString) else { return }
        beerImage.activityIndicator.startAnimating()
        beerImage.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil) { (_, error, _, _) in
            if error != nil {
                self.beerImage.image = #imageLiteral(resourceName: "emptyBeer")
            }
            self.beerImage.activityIndicator.stopAnimating()
        }
    }
}
