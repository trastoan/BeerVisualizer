//
//  ViewProtocols.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 06/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

protocol NibLoadableView: class {}

protocol EmptyStateView: class {
    func setupOn(view: UIView, withText text: String)
}
