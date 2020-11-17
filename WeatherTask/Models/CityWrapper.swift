//
//  CityWrapper.swift
//  WeatherTask
//
//  Created by Omima Ibrahim on 11/17/20.
//

import Foundation

class CityWrapper : Codable{
    var name : String
    var id : Int
    var lattLong : String
    
    enum CodingKeys : String , CodingKey {
        case name = "title"
        case id = "woeid"
        case lattLong = "latt_long"
    }
}
