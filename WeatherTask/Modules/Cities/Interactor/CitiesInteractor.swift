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
                    print(error.localizedDescription)
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
        guard !cities.isEmpty else {return}
        let dispatchGroup = DispatchGroup()
        
        for item in cities {
            dispatchGroup.enter()
            service.fetchCityInfo(code: "\(item.id)", date: getTomorrowDate()) { (result) in
                switch result {
                case .success(let response):
                    let cityInfo = response.max{$0.predictability < $1.predictability}
                    if let cityWeather = cityInfo {
                        cityWeather.cityWrapper = item
                        self.citiesWeather.append(cityWeather)
                    }
                case.failure(let error):
                    print(error.localizedDescription)
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main ){
            //TODO: reload the view
            print("should strat view")
            
        }
    }
}

extension CitiesInteractor {
    func getTomorrowDate()-> String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        if let tomorrow = today.tomorrow {
            let tomorrowString = dateFormatter.string(from: tomorrow)
            return tomorrowString
        }else{
            let todayString = dateFormatter.string(from: today)
            return todayString
        }
    }
}

// MARK:- save and get data
extension CitiesInteractor {
    func save(cities : [CityWrapper]){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(cities){
            UserDefaults.standard.set(encoded, forKey: "CitiesWrapper")
        }
    }
    
    func getCities() -> [CityWrapper] {
        if let objects = UserDefaults.standard.value(forKey: "CitiesWrapper") as? Data {
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
