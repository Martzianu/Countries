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
        if let path = Bundle.main.path(forResource: "MockCountries", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return Promise(data)
            } catch {
                return Promise(APIErrors.noData)
            }
        }

        return Promise(APIErrors.noData)
    }
}
