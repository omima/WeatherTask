//
//  CitiesAPIDataManager.swift
//
//  Created by Omima on 2020.
//  Copyright © 2018 Omima. All rights reserved.
//

import Foundation

class CitiesAPIDataManager: BaseAPIService {
    
    // MARK:- Properties
    weak var interactor: CitiesInteractorInputProtocol?
    
    // MARK:- Methods
    // MARK: Public Methods
    
    
    enum CitiesEndpoint: Endpoint {
        case city(name: String)
        var path: String {
            return "search/"
        }
        var parameters: [String : Any] {
            switch self {
            case .city(name: let name):
                return ["query": name]
            }
        }
    }
    
    func fetchCity(name : String, completion: @escaping (Result<[CityWrapper], Error>) -> ()) {
        let endPoint = CitiesEndpoint.city(name: name)
        execute(endPoint: endPoint,parameters: endPoint.parameters) { (result) in
            completion(result)
        }
    }
    
}

extension CitiesAPIDataManager {
    
    enum CityInfoEndponit: Endpoint {
        case location(code: String, date: String)

        var path: String{
            switch self {
            case .location(let code, let date):
            return "\(code)/\(date)"
            }
        }
    }
    
    func fetchCityInfo(code : String, date: String ,completion: @escaping (Result<[CityWeather], Error>) -> ()) {
        let endPoint = CityInfoEndponit.location(code: code, date: date)
        execute(endPoint: endPoint) { (result) in
            completion(result)
        }
    }

}
