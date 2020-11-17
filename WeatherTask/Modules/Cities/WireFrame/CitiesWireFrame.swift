//
//  CitiesWireFrame.swift
//
//  Created by Omima on 2020.
//  Copyright © 2018 Omima. All rights reserved.
//

import Foundation
import UIKit

class CitiesWireFrame: CitiesWireFrameProtocol {
	
	// MARK:- Constants
    struct Constants {
        static let storyBoardName: String = "Main"
        static let viewIdentifier: String = "CitiesView"
    }
    
    // MARK:- Methods
    // MARK:- Public Methods
    static func createCitiesView() -> CitiesView {
        // Generating module components
        let view = storyBoard.instantiateViewController(withIdentifier: Constants.viewIdentifier) as! CitiesView
        let presenter: CitiesPresenterProtocol & CitiesInteractorOutputProtocol = CitiesPresenter()
        let interactor: CitiesInteractorInputProtocol = CitiesInteractor()
        let apiDataManager: CitiesAPIDataManagerInputProtocol = CitiesAPIDataManager()
        let wireFrame: CitiesWireFrameProtocol = CitiesWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = apiDataManager
        
        return view
    }
    
    static var storyBoard: UIStoryboard {
        get {
            return UIStoryboard(name: Constants.storyBoardName, bundle: nil)
        }
    }
}
