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

    @IBOutlet weak var beerImageView: LoadableImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    
    //Setup UI elements
    func setupCell(with beer: Beer) {
        self.selectionStyle = .none
        nameLabel.text = beer.name
        taglineLabel.text = beer.tagline
        guard let urlString = beer.imageURL else { return }
        guard let url = URL(string: urlString) else { return }
        beerImageView.activityIndicator.startAnimating()
        Manager.shared.loadImage(with: url) { (resultImage) in
            guard let image = resultImage.value else {
                self.beerImageView.image = #imageLiteral(resourceName: "emptyBeer")
                return
            }
            self.beerImageView.image = image
            self.beerImageView.activityIndicator.stopAnimating()
        }
    }
}
