//
//  Requestor.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation
import Promises

internal class Requestor {

    /// if somebody wants to use a certain type of data fetching technology, they just select the desired requestor type
    /// Use case: new bombastic technology, but no time to convert all previous API Calls.

    func fetchCountries() -> Promise<[CountryDTO]> {
        let dbGateway: DBGateway = DBGateway(requestorType: .urlSession)
        return dbGateway.fetchCountries()
            .then { data in
                let parser: JSONParser = JSONParser()
                return Promise(parser.parseCountries(data: data))
            }
    }

    func fetchCitiesFor(countriesIds: [String]) -> Promise<[CityDTO]> {
        let dbGateway: DBGateway = DBGateway(requestorType: .urlSession)
        return dbGateway.fetchCitiesFor(countriesIds: countriesIds)
            .then { data in
                let parser: JSONParser = JSONParser()
                return Promise(parser.parseCities(data: data))
            }
    }

    func fetchCitiesNear(cityId: String) -> Promise<[CityDTO]> {
        let dbGateway: DBGateway = DBGateway(requestorType: .alamofire)
        return dbGateway.fetchCitiesNear(cityId: cityId)
            .then { data in
                let parser: JSONParser = JSONParser()
                return Promise(parser.parseCities(data: data))
            }
    }
}
