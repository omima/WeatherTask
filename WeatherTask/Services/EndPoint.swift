//
//  EndPoint.swift
//  WeatherTask
//
//  Created by Omima Ibrahim on 11/17/20.
//

import Foundation

protocol Endpoint {
    var path: String { get }
    var base: String { get }
}

extension Endpoint {
    var base: String {
        return "https://www.metaweather.com/api/location/"
    }
}
