//
//  CityWeather.swift
//  WeatherTask
//
//  Created by Omima Ibrahim on 11/17/20.
//

import Foundation

class CityWeather : Codable {
    
    var weatherState : String
    var weatherStateAbbr : String
    var minTemp : Float
    var maxTemp: Float
    var temp : Float
    var windSpeed : Float
    var humidity : Int
    var predictability : Int
    weak var cityWrapper : CityWrapper?
    
    enum CodingKeys : String , CodingKey {
        case weatherState = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case temp = "the_temp"
        case windSpeed =  "wind_speed"
        case humidity = "humidity"
        case predictability =  "predictability"
    }
    
}


