//
//  HeaderDetailsTableViewCell.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 07/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit
import Kingfisher

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
        beerImageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "emptyBeer"), options: nil, progressBlock: nil) { (_, _, _, _) in
            self.beerImageView.activityIndicator.stopAnimating()
        }
    }
}
