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
    func favorited(isFavorite: Bool)
}

protocol DetailsPresentation: class {
    weak var view: BeerDetailsViewController? { get set }
    func viewDidLoad()
    func saveToFavorites()
}

protocol DetailsUseCase: class {
    weak var output: DetailsInteractorOutput! { get  set }
    func saveToFavorites(beer: Beer)
}

protocol DetailsInteractorOutput: class {
    func favorited(isFavorite: Bool)
}

protocol DetailsWireframe: class {
    static func assembleModule(_ beer: Beer) -> UIViewController
}
