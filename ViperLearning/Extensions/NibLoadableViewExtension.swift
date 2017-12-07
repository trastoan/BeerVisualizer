//
//  NibLoadableViewExtension.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 06/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

extension NibLoadableView where Self: UIView {
    static var NibName: String {
        return String(describing: self)
    }
}
