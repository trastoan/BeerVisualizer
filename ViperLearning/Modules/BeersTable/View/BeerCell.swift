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

class BeerCell : UITableViewCell {
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerTitleLabel: UILabel!
    @IBOutlet weak var beerTagline: UILabel!
    
    func setup(_ beer: Beer) {
        beerImage.image = #imageLiteral(resourceName: "largeBeer")
        beerTitleLabel.text = beer.name
        beerTagline.text = beer.tagline
        guard let urlString = beer.imageURL else { return }
        guard let url = URL(string: urlString) else { return }
        Nuke.loadImage(with: url, into: beerImage)
    }
}
