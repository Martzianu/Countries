//
//  CacheRequestor.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation
import Promises

class CacheRequestor: APIDataRequestor {

    /// if we want to get data from the Cache and not the web, use this
    func fetchCountries() -> Promise<Data?> {
        fatalError("not implement")
    }

    func fetchCitiesFor(countriesIds: [String]) -> Promise<Data?> {
        fatalError("not implemented")
    }

    func fetchNearbyCitiesTo(cityId: String) -> Promise<Data?> {
        fatalError("not implemented")
    }
}
