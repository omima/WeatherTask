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
        interactor?.loadCities()
    }
}

// MARK:- CitiesInteractorOutputProtocol
extension CitiesPresenter: CitiesInteractorOutputProtocol {
    
}
