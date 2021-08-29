//
//  URLSessionRequestor.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation
import Promises

class URLSessionRequestor: APIDataRequestor {
    /// this class implements the DataRequestor and uses the URLSession method to make API requests

    func fetchCountries() -> Promise<Data?> {
        let urlComponents = URLComponents(string: Endpoints.countries)
        guard let url = urlComponents?.url else { return Promise(nil) }

        var request = URLRequest(url: url)
        self.addDefaultHeadersTo(request: &request)
        request.httpMethod = HTTPMethods.get.rawValue

        return Promise<Data?>(on: .global(qos: .background)) { (fullfill, reject) in
            URLSession.shared.dataTask(with: request) {(data, response, error) in

                guard let data = data else { return fullfill(nil) }
                guard error == nil else { return reject (error ?? NSError(domain: "", code: 100, userInfo: nil)) }
                fullfill(data)

            }.resume()
        }
    }

    func fetchCitiesFor(countriesIds: [String]) -> Promise<Data?> {
        var urlComponents = URLComponents(string: Endpoints.cities)
        urlComponents?.queryItems = [
          URLQueryItem(name: HeaderKeys.countryIdsKey, value: countriesIds.joined(separator: ",")),
          URLQueryItem(name: HeaderKeys.limitKey, value: HeaderValues.limit)
        ]

        guard let url = urlComponents?.url else { return Promise(nil) }

        var request = URLRequest(url: url)
        self.addDefaultHeadersTo(request: &request)
        request.addValue(countriesIds.joined(separator: ","), forHTTPHeaderField: HeaderKeys.countryIdsKey)
        request.httpMethod = HTTPMethods.get.rawValue

        return Promise<Data?>(on: .global(qos: .background)) { (fullfill, reject) in
            URLSession.shared.dataTask(with: request) {(data, response, error) in

                guard let data = data else { return fullfill(nil) }
                guard error == nil else { return reject (error ?? NSError(domain: "", code: 100, userInfo: nil)) }
                fullfill(data)

            }.resume()
        }
    }

    private func addDefaultHeadersTo(request: inout URLRequest) {
        request.addValue(HeaderValues.apiHost, forHTTPHeaderField: HeaderKeys.rapidAPIHost)
        request.addValue(HeaderValues.apiKey, forHTTPHeaderField: HeaderKeys.rapidAPIKey)
    }
}
