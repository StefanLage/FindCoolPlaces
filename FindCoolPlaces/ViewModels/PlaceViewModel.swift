//
//  PlaceViewModel.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 27/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import Foundation
import MapKit

class PlaceViewModel: NSObject {

    private(set) public var place: Venue?

    var titleText: String? {
        return self.place?.name
    }

    var coordinate: CLLocationCoordinate2D? {
        return CLLocationCoordinate2DMake((self.place?.location?.latitude)!, (self.place?.location?.longitude)!)
    }

    init (place: Venue) {
        self.place = place
    }
}
