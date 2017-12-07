//
//  HeaderDetailsTableViewCell.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 07/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit
import Nuke

class HeaderDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    
    func setupCell(with beer: Beer) {
        nameLabel.text = beer.name
        taglineLabel.text = beer.tagline
        guard let urlString = beer.imageURL else { return }
        guard let url = URL(string: urlString) else { return }
        Nuke.loadImage(with: url, into: beerImageView)
    }
}
