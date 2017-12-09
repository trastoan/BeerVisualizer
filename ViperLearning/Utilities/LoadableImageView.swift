//
//  LoadableImageView.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 08/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

class LoadableImageView: UIImageView {
    var activityIndicator = UIActivityIndicatorView()
    
    override func awakeFromNib() {
        activityIndicator.setupOn(view: self, yFromCenter: 15.0)
    }
}
