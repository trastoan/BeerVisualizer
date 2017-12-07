//
//  BeerDetailsViewController.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import UIKit
import Nuke

class BeerDetailsViewController: UIViewController, DetailsView {
    
    var presenter: BeerDetailsPresenter!
    var tableView: UITableView!
    var detailedBeer: Beer? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewDidLoad()
    }
    
    func setupView() {
        tableView = TableCreator.createTable(onView: self.view)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.register(HeaderDetailsTableViewCell.self)
        tableView.register(DescriptionTableViewCell.self)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "heartNotFilled"), style: .plain, target: self, action: #selector(saveToFavorite))
        self.navigationItem.title = "Beer Details"
    }
    
    func showDetails(forBeer beer: Beer) {
        detailedBeer = beer
    }
    
    @objc func saveToFavorite() {
        presenter.saveToFavorites()
    }
    
    func favorited(isFavorite: Bool) {
        self.navigationItem.rightBarButtonItem?.image = isFavorite ? #imageLiteral(resourceName: "heartFilled") : #imageLiteral(resourceName: "heartNotFilled")
    }
}

extension BeerDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.detailedBeer != nil ? 2 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let beer = detailedBeer else { return UITableViewCell()}
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as HeaderDetailsTableViewCell
            cell.setupCell(with: beer)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as DescriptionTableViewCell
            cell.setupView(with: beer)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
