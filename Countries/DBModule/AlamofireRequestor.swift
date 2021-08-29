//
//  AlamofireRequestor.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation
import Promises

class AlamofireRequestor: APIDataRequestor {
    /// this class implements the DataRequestor and uses Alamofire technology to make API calls

    func fetchCountries() -> Promise<Data?> {
        fatalError("implement")
    }

    func fetchCitiesFor(countriesIds: [String]) -> Promise<Data?> {
        fatalError("not implemented")
    }
}
