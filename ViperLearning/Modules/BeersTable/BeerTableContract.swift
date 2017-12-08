//
//  BeerTableContract.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

//Interface contract
protocol BeersViewInterface: class {
    func showBeersData(beers: [Beer])
    func nothingToFetch()
}

//Presenter contract
protocol BeersModuleInterface: class {
    func updateView()
    func showDetailsForBeer(beer: Beer)
}

//Use cases contract
protocol BeersUseCase: class {
    weak var output: BeerInteractorOutput! { get set }
    func fetchBeers(page: Int)
}

//Output contract for presenter
protocol BeerInteractorOutput: class {
    func beersFetched(beers: [Beer])
    func beersFetchedFailed()
}

//Wireframe Contract
protocol BeersWireframeInput {
    weak var view: UIViewController? { get set }
    
    func presentDetailsInterfaceForBeer(beer: Beer)
    static func assembleModule() -> UIViewController
}

//Interactor Contract
protocol BeerInteractorInput: class {
    func fetchBeers(page: Int)
}
