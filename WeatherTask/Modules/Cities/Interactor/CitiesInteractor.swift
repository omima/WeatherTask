//
//  CitiesInteractor.swift
//
//  Created by Omima on 2020.
//  Copyright © 2018 Omima. All rights reserved.
//

import Foundation

class CitiesInteractor {
    
    // MARK:- Constants
    struct Constants {
        static let citiesWrapperKey = "CitiesWrapper"
    }
    
    // MARK:- Properties
    weak var presenter: CitiesInteractorOutputProtocol?
    private let service: CitiesAPIDataManager
    
    var citiesName = ["Gothenburg","Stockholm", "Mountain View","London","New York", "Berlin"]
    var cities = [CityWrapper]()
    var citiesWeather = [CityWeather]()
    
    // MARK:- Initializers
    init(service: CitiesAPIDataManager) {
        self.service = service
    }
    
}

// MARK:- CitiesInteractorInputProtocol
extension CitiesInteractor: CitiesInteractorInputProtocol {
    func loadData()  {
        self.cities = getCities()
        if !cities.isEmpty {
            self.loadCityInfo()
        }else{
            cities = []
            loadCities()
        }
    }
    
    func loadCities()  {
        let dispatchGroup = DispatchGroup()
        for item in citiesName {
            dispatchGroup.enter()
            service.fetchCity(name: item) { (result) in
                switch result {
                case .success(let response):
                    if let city = response.first  {
                        self.cities.append(city)
                    }
                case .failure(let error):
                    self.presenter?.errorOccured(error: error)
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main ){
            self.save(cities: self.cities)
            self.loadCityInfo()
        }
    }
    
    
    func loadCityInfo() {
        guard !cities.isEmpty && service.isConnected() else {
            self.presenter?.errorOccured(error: BaseAPIServiceError.networkError)
            return
            
        }
        let dispatchGroup = DispatchGroup()
        
        for item in cities {
            dispatchGroup.enter()
            service.fetchCityInfo(code: "\(item.id)", date: getTomorrow(date: Date())) { (result) in
                switch result {
                case .success(let response):
                    let cityInfo = response.max{$0.predictability < $1.predictability}
                    if let cityWeather = cityInfo {
                        cityWeather.cityWrapper = item
                        self.citiesWeather.append(cityWeather)
                    }
                case.failure(let error):
                    self.presenter?.errorOccured(error: error)
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main ){
            self.presenter?.dataIsUpdated()
        }
    }
}

extension CitiesInteractor {
    func getTomorrow(date: Date)-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        if let tomorrow = date.tomorrow {
            let tomorrowString = dateFormatter.string(from: tomorrow)
            return tomorrowString
        }else{
            let todayString = dateFormatter.string(from: date)
            return todayString
        }
    }
}

// MARK:- save and get data
extension CitiesInteractor {
    func save(cities : [CityWrapper]){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(cities){
            UserDefaults.standard.set(encoded, forKey: Constants.citiesWrapperKey)
        }
    }
    
    func getCities() -> [CityWrapper] {
        if let objects = UserDefaults.standard.value(forKey: Constants.citiesWrapperKey) as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [CityWrapper] {
                return objectsDecoded
            } else {
                return []
            }
        } else {
            return []
        }
    }
}
