//
//  DetailsContract.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 06/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit
//Contracts for the modules

//View contract
protocol  DetailsView: class {
    var presenter: BeerDetailsPresenter! { get set }
    func showDetails(forBeer beer: Beer)
    func favorited(isFavorite: Bool)
}

//Presenter contract
protocol DetailsPresentation: class {
    weak var view: BeerDetailsViewController? { get set }
    func viewDidLoad()
    func saveToFavorites()
}

//Use cases contract
protocol DetailsUseCase: class {
    weak var output: DetailsInteractorOutput! { get  set }
    func saveToFavorites(beer: Beer)
}

//Output contract
protocol DetailsInteractorOutput: class {
    func favorited(isFavorite: Bool)
}

//Router contract
protocol DetailsWireframe: class {
    static func assembleModule(_ beer: Beer) -> UIViewController
}
