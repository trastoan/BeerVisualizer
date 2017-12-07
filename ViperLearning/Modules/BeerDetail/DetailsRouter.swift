//
//  DetailsRouter.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

class DetailsRouter : DetailsWireframe {
    static func assembleModule(_ beer: Beer) -> UIViewController {
        let view: BeerDetailsViewController = BeerDetailsViewController.instatiate(fromStoryboard: "Main")
        let presenter = BeerDetailsPresenter()
        let interactor = BeerDetailsInteractor()
        
        view.presenter = presenter
        
        interactor.output = presenter
        
        presenter.view = view
        presenter.beer = beer
        presenter.interactor = interactor
        
        return view
    }
}
