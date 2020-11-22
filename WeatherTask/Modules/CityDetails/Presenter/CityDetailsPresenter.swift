//
//  CityDetailsPresenter.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2018 Parent. All rights reserved.
//


import Foundation

struct CityDetailsViewModel {
    var cityName : String
    var weatherState : String
    var temp : String
    var maxTemp : String
    var minTemp: String
    var imageUrl: URL?
    var humidity: String
    var windSpeed: String
}

class CityDetailsPresenter {
    
    // MARK:- Properties
    weak var view: CityDetailsViewProtocol?
    var interactor: CityDetailsInteractorInputProtocol?
    var wireFrame: CityDetailsWireFrameProtocol?

}

// MARK:- CityDetailsPresenterProtocol
extension CityDetailsPresenter: CityDetailsPresenterProtocol {
    func viewLoaded() {
        let city = interactor!.cityWeather
       
        let name = city.cityWrapper?.name ?? ""
        let state = city.weatherState
        let theTemp = Int(city.temp)
        let temp = "\(theTemp) °"
        let maxTemp = "H:\(Int(city.maxTemp)) °"
        let minTemp = "L:\(Int(city.minTemp)) °"
        let url = URL(string: interactor!.getImgeURL())
        let humidity = "\(city.humidity) %"
        let windSpeed = "\(Int(city.windSpeed))"

        let cityDetails = CityDetailsViewModel(cityName: name, weatherState: state, temp: temp, maxTemp: maxTemp, minTemp: minTemp, imageUrl: url, humidity: humidity, windSpeed: windSpeed)
        
        view?.configureView(with: cityDetails)
    }
    
}

// MARK:- CityDetailsInteractorOutputProtocol
extension CityDetailsPresenter: CityDetailsInteractorOutputProtocol {
    
}
