//
//  CitiesPresenter.swift
//
//  Created by Omima on 2020.
//  Copyright © 2018 Omima. All rights reserved.
//


import Foundation

class CitiesPresenter {
    
    // MARK:- Properties
    weak var view: CitiesViewProtocol?
    var interactor: CitiesInteractorInputProtocol?
    var wireFrame: CitiesWireFrameProtocol?

}

// MARK:- CitiesPresenterProtocol
extension CitiesPresenter: CitiesPresenterProtocol {
    func viewLoaded() {
        interactor?.loadData()
    }
    
    func numberOfItems() -> Int {
       return interactor!.citiesWeather.count 
    }
    
    func getWeatherItem(at index: Int) -> CityWeather {
       return interactor!.citiesWeather[index]
    }
    
    func openDetailsView(at index : Int) {
        wireFrame?.openDetails(from: view!, with:  interactor!.citiesWeather[index])
    }
}

// MARK:- CitiesInteractorOutputProtocol
extension CitiesPresenter: CitiesInteractorOutputProtocol {
    func dataIsUpdated() {
        view?.reloadData()
    }
    
}
