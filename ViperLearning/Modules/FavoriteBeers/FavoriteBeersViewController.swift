//
//  FavoriteBeersViewController.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 07/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

class FavoriteBeersViewController: UIViewController, FavoritesViewInterface {

    var tableView: UITableView!
    var presenter: FavoritesPresenter!
    var emptyState = NoBeersFetched.viewForNib() as! NoBeersFetched
    
    var beersData: [Beer] = [Beer]() {
        didSet {
            emptyState.isHidden = beersData.count > 0
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = TableCreator.createTable(onView: self.view)
        setupView()
        // Do any additional setup after loading the view.
    }
    
    /*the presenter fetch needs to be in the will appear to handle fast
     interaction of the user when favoriting beers */
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewDidLoad()
    }
    
    //Configure the view UI
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView  = UIView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 124.0
        tableView.register(BeerCell.self)
        emptyState.setupOn(view: self.view, withText: "No favorites to show")
        
        self.navigationItem.title = "Favorite Beers"
        self.preferLargeTitles()
    }
    
    //Show data acquired from presenter
    func showBeersData(beers: [Beer]) {
        beersData = beers
    }
    
    //Show empty state if error ocurred
    func showEmptyState() {
        emptyState.isHidden = false
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
