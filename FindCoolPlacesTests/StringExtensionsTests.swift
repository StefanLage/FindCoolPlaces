//
//  StringExtensionsTests.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 25/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import XCTest
@testable import FindCoolPlaces

class StringExtensionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUrlFormat() {
        // Test the foursquare url formatter -> make sure it combine the endpoint and parameters the right way
        let params = ["client_id" : "blabla",
                      "client_secret" : "topsecret",
                      "v" : "20170725",
                      "near" : "London"]

        let urlFormatted = String.FoursquareUrlFormat(endPoint: "https://test.co.uk/HelloWorld", parameters: params)
        XCTAssertNotNil (urlFormatted, "should not ne nil")
        XCTAssertEqual(urlFormatted, "https://test.co.uk/HelloWorld?client_secret=topsecret&v=20170725&near=London&client_id=blabla", "the url should be equal to: https://test.co.uk/HelloWorld?client_secret=topsecret&v=20170725&near=London&client_id=blabla")
    }
}
