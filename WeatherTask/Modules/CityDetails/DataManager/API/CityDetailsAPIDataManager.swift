//
//  CityDetailsAPIDataManager.swift
//  Parent
//
//  Created by Omima on 2020.
//  Copyright © 2018 Parent. All rights reserved.
//

import Foundation

class CityDetailsAPIDataManager: BaseAPIService {
    
    // MARK:- Properties
    weak var interactor: CityDetailsInteractorInputProtocol?
    
    // MARK:- Methods
    // MARK: Public Methods
    
    enum CitydetailsEndponit: Endpoint {
        case image(name: String)

        var path: String{
            switch self {
            case .image(let name):
            return "https://www.metaweather.com/static/img/weather/png/64/\(name).png"
            }
        }
    }
    
    func getImageURL(imageName : String) -> String {
        let endPoint = CitydetailsEndponit.image(name: imageName)
        return endPoint.path
    }
    
}
