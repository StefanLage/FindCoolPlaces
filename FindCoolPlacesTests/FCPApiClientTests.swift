//
//  FCPApiClientTests.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 25/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import XCTest
@testable import FindCoolPlaces

class FCPApiClientTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetVenues() {
        DispatchQueue.main.async {
            // Add expectation for asynchronous test
            let getVenues = self.expectation(description: "GET testGetVenues")

            // try to get venues
            FCPApi.sharedClient.explore(location:"London"){
                (venues: Array<Venue>?,error: Error?) in
                XCTAssertNotNil(venues, "Should have an array of venues instances")
                XCTAssertGreaterThan(venues!.count, 0, "We should retrieve more than 0 venues")
                // Fulfill expectation
                getVenues.fulfill()
            }

            // Wait for it...
            self.waitForExpectations(timeout: 5) { error in
                print ("testGetVenues - Time out")
            }
        }
    }
    
}
