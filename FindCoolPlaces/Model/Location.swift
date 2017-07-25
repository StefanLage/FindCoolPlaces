//
//  Location.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 25/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import ObjectMapper

class Location: Mappable {
    var longitude: Double?
    var latitude: Double?

    required init?(map: Map){
    }

    func mapping(map: Map) {
        longitude <- map["lng"]
        latitude <- map["lat"]
    }
}
