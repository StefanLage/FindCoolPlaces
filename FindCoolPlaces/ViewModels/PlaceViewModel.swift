//
//  PlaceViewModel.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 27/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import Foundation

class PlaceViewModel: NSObject {

    private(set) public var place: Venue?

    var titleText: String?{
        return self.place?.name
    }
    
    var longitude: Double?{
        return self.place?.location?.longitude
    }
    
    var latitude: Double?{
        return self.place?.location?.latitude
    }

    init (place: Venue){
        self.place = place
    }
}
