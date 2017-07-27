//
//  FCPConstants.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 25/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import Foundation

struct Constants {
    struct APIConfig {
        static let baseUrl = "https://api.foursquare.com/v2/"
    }
    struct ApiParameters{
        // NEVER HARDCODE THOSE!!!!
        static let clientIdKey = "client_id"
        static let clientIdValue = "TE1KLATJ4KB5RPZYPUPXLWZMUUN51Q3KPYF3L4MUPTNGCRYN"
        static let clientSecretKey = "client_secret"
        static let clientSecretValue = "NGM2GB3QR3O1BTSVXWZN4NLSLKPMAU13KMNPUMLZULLZP3M2"
        static let versionKey = "v"
        static let versionValue = "20170725"
        static let nearKey = "near"
        static let limitKey = "limit"
    }
    struct EndPoints{
        static let explore = "venues/explore"
    }
}
