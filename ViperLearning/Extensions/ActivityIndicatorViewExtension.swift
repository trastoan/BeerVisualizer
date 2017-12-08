//
//  ActivityIndicatorViewExtension.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 08/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit
//Helps to setup activity indicator on view with autolayout
extension UIActivityIndicatorView {
    func setupOn(view: UIView, xFromCenter: CGFloat = 0.0, yFromCenter: CGFloat = 0.0) {
        view.addSubview(self)
        self.activityIndicatorViewStyle = .gray
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xFromCenter).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yFromCenter).isActive = true
    }
}
