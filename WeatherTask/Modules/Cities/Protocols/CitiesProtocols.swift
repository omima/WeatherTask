//
//  CitiesProtocols.swift
//
//  Created by Omima on 2020.
//  Copyright © 2018 Omima. All rights reserved.
//

import Foundation

// MARK:- View protocols
// MARK: Presenter -> View
protocol CitiesViewProtocol: class {
    var presenter: CitiesPresenterProtocol? { get set }
    func reloadData()
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol CitiesPresenterProtocol: class {
    var view: CitiesViewProtocol? { get set }
    var interactor: CitiesInteractorInputProtocol? { get set }
    var wireFrame: CitiesWireFrameProtocol? { get set }
    
    func viewLoaded()
    func numberOfItems() -> Int
    func getWeatherItem(at index: Int) -> CityWeather
    func openDetailsView(at index : Int)
}

// MARK: Interactor -> Presenter
protocol CitiesInteractorOutputProtocol: class {
    func dataIsUpdated()
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol CitiesInteractorInputProtocol: class {
    var presenter: CitiesInteractorOutputProtocol? { get set }
    var citiesWeather : [CityWeather] { get }

    func loadData()
}

// MARK:- Wireframe Protocols
protocol CitiesWireFrameProtocol: class {
    static func createCitiesView() -> CitiesView
    func openDetails(from view:CitiesViewProtocol, with weather: CityWeather)
}
