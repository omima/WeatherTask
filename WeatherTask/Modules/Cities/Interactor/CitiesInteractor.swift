//
//  CitiesInteractor.swift
//
//  Created by Omima on 2020.
//  Copyright © 2018 Omima. All rights reserved.
//

import Foundation

class CitiesInteractor {
    
    // MARK:- Properties
    weak var presenter: CitiesInteractorOutputProtocol?
    var APIDataManager: CitiesAPIDataManagerInputProtocol?

}

// MARK:- CitiesInteractorInputProtocol
extension CitiesInteractor: CitiesInteractorInputProtocol {
        
}
