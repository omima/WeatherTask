//
//  CityDetailsWireFrame.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2018 Parent. All rights reserved.
//

import Foundation
import UIKit

class CityDetailsWireFrame: CityDetailsWireFrameProtocol {
	
	// MARK:- Constants
    struct Constants {
        static let storyBoardName: String = "Main"
        static let viewIdentifier: String = "CityDetailsView"
    }
    
    // MARK:- Methods
    // MARK:- Public Methods
    static func createCityDetailsView(with weather: CityWeather ) -> CityDetailsView {
        // Generating module components
        let view = storyBoard.instantiateViewController(withIdentifier: Constants.viewIdentifier) as! CityDetailsView
        let presenter: CityDetailsPresenterProtocol & CityDetailsInteractorOutputProtocol = CityDetailsPresenter()
        let service = CityDetailsAPIDataManager()
        let interactor: CityDetailsInteractorInputProtocol = CityDetailsInteractor(service: service, weather: weather)
        let wireFrame: CityDetailsWireFrameProtocol = CityDetailsWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
            
        return view
    }
    
    static var storyBoard: UIStoryboard {
        get {
            return UIStoryboard(name: Constants.storyBoardName, bundle: nil)
        }
    }
}
