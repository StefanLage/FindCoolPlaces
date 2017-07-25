//
//  FCPApi.swift
//  FindCoolPlaces
//
//  Created by Stefan Lage on 25/07/2017.
//  Copyright © 2017 Stefan Lage. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class FCPApi: NSObject {
    static let sharedClient = FCPApi()
}

// MARK: Network management
private typealias FCPApiNetwork = FCPApi
private extension FCPApiNetwork{

    /**

     GET query to the API
     Send back the data or error (if there is some) using completion closure

     - endPoint
     - completionHandler: closure that will be use to return any data or errors when the request is done

     */
    func request<T> (endPoint: String , completionHandler: (([T]?, Error?) -> Void)?) where T: Mappable{

        let url = URL(string: String(format: "%@%@", Constants.APIConfig.baseUrl, endPoint))
            // Send query
        Alamofire.request(url!).responseArray(keyPath: "response.groups") { (response: DataResponse<[Group]>) in
            // SUCCESS ?
            if (response.response?.statusCode == 200){
                let groups = response.result.value
                let venues = groups?.flatMap { $0.items } .flatMap{ $0 }.map { $0.venue! }
                completionHandler? (venues as? [T], nil)
            }
            else{
                // FAILED
                completionHandler? (nil, response.error)
            }
        }
    }
}

private typealias BPPublicApiNetwork = FCPApi
extension BPPublicApiNetwork{

    /**

     GET all venues

     - completion: send Venues to this callback or an error

     */
    func explore (location: String, completion: ((Array<Venue>?, Error?) -> Void)?){
        // Define all parameter for this request
        let parameters = [
            Constants.ApiParameters.clientIdKey : Constants.ApiParameters.clientIdValue,
            Constants.ApiParameters.clientSecretKey: Constants.ApiParameters.clientSecretValue,
            Constants.ApiParameters.versionKey: Constants.ApiParameters.versionValue,
            Constants.ApiParameters.nearKey: location,
            Constants.ApiParameters.limitKey: "2"
        ]
        // Make the endPoint
        let endPoint = String.FoursquareUrlFormat(endPoint: Constants.EndPoints.explore, parameters: parameters)
        request(endPoint: endPoint, completionHandler: completion)
    }
}
