//
//  ActivityIndicatorViewExtension.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 08/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    func setupOn(view: UIView) {
        view.addSubview(self)
        self.activityIndicatorViewStyle = .gray
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
