//
//  CityDetailsPresenter.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2018 Parent. All rights reserved.
//


import Foundation

class CityDetailsPresenter {
    
    // MARK:- Properties
    weak var view: CityDetailsViewProtocol?
    var interactor: CityDetailsInteractorInputProtocol?
    var wireFrame: CityDetailsWireFrameProtocol?

}

// MARK:- CityDetailsPresenterProtocol
extension CityDetailsPresenter: CityDetailsPresenterProtocol {
    func viewLoaded() {
        view?.configureView(with: interactor!.cityWeather,imageUrl: interactor!.getImgeURL())
    }
    
}

// MARK:- CityDetailsInteractorOutputProtocol
extension CityDetailsPresenter: CityDetailsInteractorOutputProtocol {
    
}
