//
//  Venue.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 25/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import ObjectMapper

class Venue: Mappable {
    var id: String?
    var location: Location?
    var name: String?

    required init?(map: Map){
    }

    func mapping(map: Map) {
        id <- map["id"]
        location <- map["location"]
        name <- map["name"]
    }
}
