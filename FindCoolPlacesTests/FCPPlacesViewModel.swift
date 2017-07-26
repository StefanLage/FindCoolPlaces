//
//  FCPPlacesViewModel.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 26/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import XCTest
@testable import FindCoolPlaces
import ObjectMapper

class FCPPlacesViewModel: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPlacesViewModel() {

        let fancyPlaces: [Venue?] = [Venue(JSONString: "{\"id\": \"1\",\"name\": \"Oxford Circus\",\"location\": {\"lat\": 51.515419,\"lng\": -0.141099}}")!,
                               Venue(JSONString: "{\"id\": \"2\",\"name\": \"Piccadilly Circus\",\"location\": {\"lat\": 51.510067,\"lng\": -0.133869}}")!]
        
        XCTAssertEqual(fancyPlaces.count, 2, "Should have 2 venues")
        let placesViewModel = PlacesViewModel()
        
        placesViewModel.venues.bindAndFire(listener:{
            (venues) in
            guard venues.count > 0 else{
                return
            }
            XCTAssertTrue(venues.first as AnyObject? === fancyPlaces.first as AnyObject?, "1st places should point to the same address")
            XCTAssertTrue(venues.last as AnyObject? === fancyPlaces.last as AnyObject?, "2nd places should point to the same reference")
        })
        
        placesViewModel.updateVenues(places: fancyPlaces)
    }
}
