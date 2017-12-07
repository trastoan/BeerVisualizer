//
//  DetailsContract.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 06/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

protocol  DetailsView: class {
    var presenter: BeerDetailsPresenter! { get set }
    
    func showDetails(forBeer beer: Beer)
}

protocol DetailsPresentation: class {
    weak var view: BeerDetailsViewController? { get set }
    func viewDidLoad()
}

protocol DetailsWireframe: class {
    static func assembleModule(_ beer: Beer) -> UIViewController
}
