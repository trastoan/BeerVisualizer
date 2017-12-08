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
    
    //Load view from nib using class reference
    static func viewForNib<T: UIView>() -> T? {
        guard let view =  Bundle.main.loadNibNamed(Self.NibName, owner: self, options: nil)?.first as? T else{
            return nil
        }
        
        return view
    }
}
