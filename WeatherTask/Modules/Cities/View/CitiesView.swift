//
//  CitiesView.swift
//
//  Created by Omima on 2020.
//  Copyright © 2018 Omima. All rights reserved.
//

import Foundation
import UIKit

class CitiesView: BaseViewController {
    
    // MARK:- Constants
    struct Constants {
        static let cellIdentifier = "CityWeatherTableViewCell"
    }
    
    // MARK:- Properties
    var presenter: CitiesPresenterProtocol?
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewLoaded()
    }
    
    // MARK:- Methods
    // MARK: Public Methods
    
    // MARK: Private Methods
    fileprivate func registerCell(){
        let cityCell = UINib(nibName: Constants.cellIdentifier, bundle:nil)
        tableView.register(cityCell, forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
}

// MARK:- CitiesViewProtocol
extension CitiesView: CitiesViewProtocol {
    func reloadData() {
        tableView.reloadData()
    }
}

extension CitiesView: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as! CityWeatherTableViewCell
        if let weatherData = presenter?.getWeatherItem(at: indexPath.row){
            cell.configure(with: weatherData)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.openDetailsView(at: indexPath.row)
    }
}
