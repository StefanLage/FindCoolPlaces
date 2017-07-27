//
//  FCPPlaceViewModel.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 27/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import XCTest
@testable import FindCoolPlaces
import ObjectMapper

class FCPPlaceViewModel: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAddingCoolPlace() {
        let coolPlace = Venue(JSONString: "{\"id\": \"1\",\"name\": \"Oxford Circus\",\"location\": {\"lat\": 51.515419,\"lng\": -0.141099}}")!

        let placeViewModel = PlaceViewModel(place: coolPlace)
        XCTAssertEqual(placeViewModel.titleText, "Oxford Circus")
        XCTAssertEqual(placeViewModel.coordinate?.latitude, 51.515419)
        XCTAssertEqual(placeViewModel.coordinate?.longitude, -0.141099)
    }
}
