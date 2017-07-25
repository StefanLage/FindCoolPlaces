//
//  Item.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 25/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import ObjectMapper

class Item: Mappable {
    var referralId: String?
    var venue: Venue?

    required init?(map: Map){
    }

    func mapping(map: Map) {
        referralId <- map["referralId"]
        venue <- map["venue"]
    }
}
