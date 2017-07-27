//
//  FCPWorkFlowTests.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 27/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import XCTest

class FCPWorkFlowTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWorkFlow() {
        let app = XCUIApplication()
        let searchForPlacesSearchField = app.navigationBars["FindCoolPlaces.PlacesView"].searchFields["Search for places"]
        searchForPlacesSearchField.tap()
        // Go to London and find some places
        searchForPlacesSearchField.typeText("London")
        app.otherElements["National Gallery"].tap()
        let popoverdismissregionElement = app.otherElements["PopoverDismissRegion"]
        popoverdismissregionElement.tap()
        // Now go to San francisco
        searchForPlacesSearchField.buttons["Clear text"].tap()
        searchForPlacesSearchField.typeText("San Francisco")
    }
    
}
