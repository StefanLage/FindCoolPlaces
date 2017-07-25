//
//  Group.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 25/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import ObjectMapper

class Group: Mappable {
    var items: [Item]?

    required init?(map: Map){
    }

    func mapping(map: Map) {
        items <- map["items"]
    }
}
