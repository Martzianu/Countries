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
    private var dbGateway: DBGateway = DBGateway(requestorType: .mock)

    func fetchCountries() -> Promise<[CountryDTO]> {
        self.dbGateway.fetchCountries()
            .then { data in
                let parser: JSONParser = JSONParser()
                return Promise(parser.parseCountries(data: data))
            }
    }
}
