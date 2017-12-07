//
//  UIViewControllerExtension.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

extension UIViewController {
    static func instatiate<T>(fromStoryboard storyboard: String) -> T {
        let bundle = Bundle(for: T.self as! AnyClass)
        let storyboard = UIStoryboard(name: storyboard, bundle: bundle)
        let identifier = String(describing: self)
        
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
