//
//  DescriptionTableViewCell.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 07/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setupView(with beer: Beer) {
        self.selectionStyle = .none
        descriptionLabel.text = beer.details
    }
}
