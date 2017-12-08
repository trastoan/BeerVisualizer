//
//  NoBeersFetched.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 06/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit
//Empty state view for fetch problems
class NoBeersFetched: UIView, NibLoadableView, EmptyStateView {
    @IBOutlet weak var warningLabel: UILabel!
    //Setup UI from view, including AutoLayout to center on view
    func setupOn(view: UIView, withText text: String) {
        view.addSubview(self)
        self.warningLabel.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
