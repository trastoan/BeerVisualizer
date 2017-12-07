//
//  FavoriteBeersViewController.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 07/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

class FavoriteBeersViewController: UIViewController, FavoritesViewInterface {

    @IBOutlet weak var tableView: UITableView!
    var presenter: FavoritesPresenter!
    var beersData: [Beer] = [Beer]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView  = UIView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 124.0
        tableView.register(BeerCell.self)
        
        self.navigationItem.title = "Favorite Beers"
        self.preferLargeTitles()
    }
    
    func showBeersData(beers: [Beer]) {
        beersData = beers
    }
    
    func showEmptyState() {
        //TODO
    }
    
}

extension FavoriteBeersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as BeerCell
        cell.setup(beersData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showDetailsForBeer(beer: beersData[indexPath.row])
    }
    
}
