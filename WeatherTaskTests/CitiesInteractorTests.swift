//
//  CitiesInteractorTests.swift
//  WeatherTaskTests
//
//  Created by Omima Ibrahim on 11/20/20.
//

import Foundation
import Quick
import Nimble
import Mockit

@testable import WeatherTask

class CitiesInteractorTests: QuickSpec {
    
    override func spec() {
        var interactor: CitiesInteractor!
        var service: CitiesAPIDataManagerMock!
        
        beforeEach {
            service = CitiesAPIDataManagerMock(testCase: self)
            interactor = CitiesInteractor(service: service)
        }
        
        describe("testing cities interactor"){
            context("after get cities"){
                it("Should return tomorrow date") {
                    let dateString = "2020/11/21"
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/yyyy"
                    let dateFromString = dateFormatter.date(from: dateString)
                    expect( interactor.getTomorrow(date: dateFromString ?? Date())).to(equal("2020/11/22"))
                }
            }
        }
        
    }
    
    
}
