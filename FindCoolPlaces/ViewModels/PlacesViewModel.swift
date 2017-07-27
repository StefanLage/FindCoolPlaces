//
//  PlacesViewModel.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 26/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import Foundation

class PlacesViewModel: NSObject {

    internal(set) public var places: Dynamic<[PlaceViewModel?]>!

    override init () {
        super.init()
        
        self.places = Dynamic([PlaceViewModel?]())
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
}

// MARK: - Public methods
private typealias PlacesViewModelPublic = PlacesViewModel
extension PlacesViewModelPublic {
    /**

     Update places source

     */
    func updateVenues(places : [Venue]) {
        self.places.value = places.map ({
            (venue: Venue) -> PlaceViewModel in
            return PlaceViewModel(place: venue)
        })
    }
}
