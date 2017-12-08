//
//  ActivityIndicatorViewExtension.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 08/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    func setupOn(view: UIView, x: CGFloat = 0.0, y: CGFloat = 0.0) {
        view.addSubview(self)
        self.activityIndicatorViewStyle = .gray
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: x).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: y).isActive = true
    }
}
