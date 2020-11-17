//
//  Extension.swift
//  WeatherTask
//
//  Created by Omima Ibrahim on 11/17/20.
//

import Foundation

extension Date {
    var tomorrow: Date? {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)
    }
}
