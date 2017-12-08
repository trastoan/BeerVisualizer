//
//  BeerCell.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation
import Nuke
import UIKit

class BeerCell: UITableViewCell {
    @IBOutlet weak var beerImage: LoadableImageView!
    @IBOutlet weak var beerTitleLabel: UILabel!
    @IBOutlet weak var beerTagline: UILabel!
    
    //Setup cell UI elements with Beer object
    func setup(_ beer: Beer) {
        self.accessoryType = .disclosureIndicator
        beerImage.image = #imageLiteral(resourceName: "emptyBeer")
        beerTitleLabel.text = beer.name
        beerTagline.text = beer.tagline
        guard let urlString = beer.imageURL else { return }
        guard let url = URL(string: urlString) else { return }
        beerImage.activityIndicator.startAnimating()
        Manager.shared.loadImage(with: url) { (resultImage) in
            if let image = resultImage.value {
                self.beerImage.image = image
                self.beerImage.activityIndicator.stopAnimating()
            }
        }
    }
}
