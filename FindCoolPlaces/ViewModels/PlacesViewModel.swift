//
//  PlacesViewModel.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 26/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import Foundation

class PlacesViewModel: NSObject {

    internal(set) public var venues: Dynamic<[Venue?]>!

    override init () {
        super.init()
        
        self.venues = Dynamic([Venue?]())
    }

}

extension PlacesViewModel{

    /**

    Send message to the API client to try to get all places near a location

    location: location where to find coolest places around

     */
    internal func findPlaces (location: String) {
        FCPApi.sharedClient.explore(location: location) {
            (venues, error) in
            guard venues != nil else {
                // TODO make an alert service and popup the error
                return
            }
            // Update datasource
            self.updateVenues(places: venues!)
        }
    }

    /**

     Update places source

     */
    func updateVenues(places : [Venue?]) {
        self.venues.value = places
    }
}
