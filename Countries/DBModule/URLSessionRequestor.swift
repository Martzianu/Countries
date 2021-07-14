//
//  URLSessionRequestor.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation

class URLSessionRequestor: APIDataRequestor {
    /// this class implements the DataRequestor and uses the URLSession method to make API requests

    func fetchCountries() {
        guard let url = URL(string: Endpoints.countries) else { return }

        var request = URLRequest(url: url)
        self.addDefaultHeadersTo(request: &request)
        request.httpMethod = HTTPMethods.get.rawValue

        URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }.resume()
    }

    private func addDefaultHeadersTo(request: inout URLRequest) {
        request.addValue(HeaderValues.apiHost, forHTTPHeaderField: HeaderKeys.rapidAPIHost)
        request.addValue(HeaderValues.apiKey, forHTTPHeaderField: HeaderKeys.rapidAPIKey)
    }
}
