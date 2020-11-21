//
//  CitiesAPIDataManagerMock.swift
//  WeatherTaskTests
//
//  Created by Omima Ibrahim on 11/20/20.
//

import Foundation
import Mockit
import Quick
import Nimble

@testable import WeatherTask

class CitiesAPIDataManagerMock: CitiesAPIDataManager, Mock{
    // required by Mockit framework Mock protocol
    let callHandler: CallHandler
    
    // required by Mockit framework Mock protocol
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    // required by Mockit framework Mock protocol
    func instanceType() -> CitiesAPIDataManager {
        return self
    }
}
