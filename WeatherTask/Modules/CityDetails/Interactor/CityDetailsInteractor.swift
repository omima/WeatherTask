//
//  CityDetailsInteractor.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2018 Parent. All rights reserved.
//

import Foundation

class CityDetailsInteractor {
    
    // MARK:- Properties
    weak var presenter: CityDetailsInteractorOutputProtocol?
    
    private let service: CityDetailsAPIDataManager
    var cityWeather : CityWeather
   
    
    // MARK:- Initializers
    init(service: CityDetailsAPIDataManager, weather : CityWeather) {
        self.service = service
        self.cityWeather = weather
    }

}

// MARK:- CityDetailsInteractorInputProtocol
extension CityDetailsInteractor: CityDetailsInteractorInputProtocol {
    func getImgeURL() -> String {
        service.getImageURL(imageName: cityWeather.weatherStateAbbr)
    }
}
