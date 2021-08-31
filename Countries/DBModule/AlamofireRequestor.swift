//
//  AlamofireRequestor.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Alamofire
import Foundation
import Promises

class AlamofireRequestor: APIDataRequestor {
    /// this class implements the DataRequestor and uses Alamofire technology to make API calls

    func fetchCountries() -> Promise<Data?> {
        fatalError("not implement")
    }

    func fetchCitiesFor(countriesIds: [String]) -> Promise<Data?> {
        fatalError("not implemented")
    }

    func fetchNearbyCitiesTo(cityId: String) -> Promise<Data?> {
        let urlString = String(format: Endpoints.nearbyCities, cityId)
        let request = AF.request(urlString,
                                 method: HTTPMethod.get,
                                 headers: defaultHeadersTo())

        return Promise<Data?>(on: .global(qos: .background)) { (fullfill, reject) in
            request.responseData(completionHandler: { data in
                fullfill(data.data)
            })
        }
    }

    private func defaultHeadersTo() -> HTTPHeaders {
        return HTTPHeaders([HTTPHeader(name: HeaderKeys.rapidAPIHost, value: HeaderValues.apiHost),
                          HTTPHeader(name: HeaderKeys.rapidAPIKey, value: HeaderValues.apiKey)])
    }
}
