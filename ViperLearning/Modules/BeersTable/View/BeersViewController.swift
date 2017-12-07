//
//  BeersViewController.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit

class BeersViewController: UIViewController, BeersViewInterface {

    @IBOutlet weak var tableView: UITableView!
    var presenter: BeersPresenter!
    var beersData = [Beer]() {
        didSet {
            tableView.reloadData()
        }
    }
    var pageNumber = 1
    var isDataLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.updateView()
    }
    
    fileprivate func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 124.0
        tableView.tableFooterView = UIView()
        tableView.register(BeerCell.self)
        
        self.navigationItem.title = "Beers"
        self.preferLargeTitles()
    }

    func showBeersData(beers: [Beer]) {
        beersData = beers
    }
    
    func showEmptyState() {
        //Show empty screen
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
    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        pageNumber += 1
//        presenter.getMoreBeers(page: pageNumber)
//    }
}
