//
//  CityDetailsProtocols.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2018 Parent. All rights reserved.
//

import Foundation

// MARK:- View protocols
// MARK: Presenter -> View
protocol CityDetailsViewProtocol: class {
    var presenter: CityDetailsPresenterProtocol? { get set }
    func configureView(with city : CityDetailsViewModel)
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol CityDetailsPresenterProtocol: class {
    var view: CityDetailsViewProtocol? { get set }
    var interactor: CityDetailsInteractorInputProtocol? { get set }
    var wireFrame: CityDetailsWireFrameProtocol? { get set }
    func viewLoaded()

}

// MARK: Interactor -> Presenter
protocol CityDetailsInteractorOutputProtocol: class {

    
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol CityDetailsInteractorInputProtocol: class {
    var presenter: CityDetailsInteractorOutputProtocol? { get set }
    var cityWeather : CityWeather { get }
    func getImgeURL() -> String

}

// MARK:- Wireframe Protocols
protocol CityDetailsWireFrameProtocol: class {
    static func createCityDetailsView(with weather: CityWeather) -> CityDetailsView
}


