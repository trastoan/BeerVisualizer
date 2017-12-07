//
//  ReusableViewExtension.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 06/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
