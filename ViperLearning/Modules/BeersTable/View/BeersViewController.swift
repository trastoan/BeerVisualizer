//
//  BeersViewController.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

class BeersViewController: UIViewController, BeersViewInterface {
    
    var tableView: UITableView!
    var presenter: BeersPresenter!
    var activityIndicator = UIActivityIndicatorView()
    var emptyState = NoBeersFetched.viewForNib() as! NoBeersFetched
    var beersData = [Beer]() {
        didSet {
            tableView.reloadData()
        }
    }
    var pageNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = TableCreator.createTable(onView: self.view)
        setupView()
        activityIndicator.startAnimating()
        presenter.updateView()
    }
    
    fileprivate func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 124.0
        tableView.tableFooterView = UIView()
        tableView.register(BeerCell.self)
        emptyState.setupOn(view: self.view, withText: "Couldn't fetch your beers")
        emptyState.isHidden = true
        activityIndicator.setupOn(view: self.view)
        
        self.navigationItem.title = "Beers"
        self.preferLargeTitles()
    }

    func showBeersData(beers: [Beer]) {
        activityIndicator.stopAnimating()
        beersData = beers
    }
    
    func showEmptyState() {
        activityIndicator.stopAnimating()
        emptyState.isHidden = false
    }
}

extension BeersViewController: UITableViewDelegate, UITableViewDataSource {
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
