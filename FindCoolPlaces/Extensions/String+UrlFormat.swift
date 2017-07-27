//
//  StringExtensions.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 25/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import Foundation

extension String{

    /**
        Combine endPoint and request parameters to conform Foursquare
        query format : https://url/endPoint?param1=velue1&....

    */
    static func FoursquareUrlFormat(endPoint: String, parameters: [String: String]) -> String{
        var url = endPoint + "?"
        let params = parameters.map{ "\($0)=\($1)" }.joined(separator: "&")
        url += params
        return url
    }
}
