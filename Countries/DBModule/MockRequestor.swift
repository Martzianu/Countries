//
//  MockRequestor.swift
//  Countries
//
//  Created by Marcean, Dragos on 7/14/21.
//

import Foundation
import Promises

internal class MockRequestor: APIDataRequestor {
    /// this is just for testing purposes

    func fetchCountries() -> Promise<Data?> {
        //return hard-coded countries
        return Promise(nil)
    }
}
