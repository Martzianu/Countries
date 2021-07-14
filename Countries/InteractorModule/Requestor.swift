//
//  Requestor.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation

internal class Requestor {

    /// if somebody wants to use a certain type of data fetching technology, they just select the desired requestor type
    /// Use case: new bombastic technology, but no time to convert all previous API Calls.
    private var dbGateway: DBGateway = DBGateway(requestorType: .urlSession)

    func getCountries() -> [Country] {
        self.dbGateway.fetchCountries()

        /// here we need to check what kind of DTO we have and use the correct parser
        let parser: JSONParser = JSONParser()
        return parser.parseCountries(json: [:])
    }
}
