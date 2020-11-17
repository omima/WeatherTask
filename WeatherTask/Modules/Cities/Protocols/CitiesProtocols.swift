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
}

// MARK:- Presenter protocols
// MARK: View -> Presenter
protocol CitiesPresenterProtocol: class {
    var view: CitiesViewProtocol? { get set }
    var interactor: CitiesInteractorInputProtocol? { get set }
    var wireFrame: CitiesWireFrameProtocol? { get set }
    
    func viewLoaded()
}

// MARK: Interactor -> Presenter
protocol CitiesInteractorOutputProtocol: class {
    
}

// MARK:- Interactor Protocols
// MARK: Presenter -> Interactor
protocol CitiesInteractorInputProtocol: class {
    var presenter: CitiesInteractorOutputProtocol? { get set }
    func loadData()
}

// MARK:- Wireframe Protocols
protocol CitiesWireFrameProtocol: class {
    static func createCitiesView() -> CitiesView
}
