//
//  CityDetailsView.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2018 Parent. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class CityDetailsView: UIViewController {
    
    // MARK:- Constants
    struct Constants {
    }
    
    // MARK:- Properties
    var presenter: CityDetailsPresenterProtocol?
    
    // MARK: Outlets
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherStateLabel: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var weatherState: UIImageView!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    
    // MARK:- UIViewController
    override func viewDidLoad() {
        presenter?.viewLoaded()
    }
    
    // MARK:- Methods
    // MARK: Public Methods
    // MARK: Private Methods
    // MARK: Actions
}

// MARK:- CityDetailsViewProtocol
extension CityDetailsView: CityDetailsViewProtocol {
    func configureView(with city: CityDetailsViewModel) {
        
        cityName.text = city.cityName
        weatherStateLabel.text = city.weatherState
        temp.text = city.temp
        maxTemp.text = city.maxTemp
        minTemp.text = city.maxTemp
        weatherState.kf.setImage(with: city.imageUrl)
        humidity.text = city.humidity
        windSpeed.text = city.windSpeed
    }

}
