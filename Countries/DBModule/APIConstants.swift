//
//  APIConstants.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/26/21.
//

import Foundation

internal enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
}

enum HeaderKeys {
    static let rapidAPIKey: String = "X-RapidAPI-Key"
    static let rapidAPIHost: String = "X-RapidAPI-Host"
    static let limitKey = "limit"
    
    static let countryIdsKey: String = "countryIds"
}

enum HeaderValues {
    static let apiKey: String = "0e3eb11582mshd3e9e90e53e9e08p1bfa31jsn50dcdb56b150"
    static let apiHost: String = "wft-geo-db.p.rapidapi.com"
    static let limit: String = "10"
}

enum Endpoints {
    private static let base: String = "https://wft-geo-db.p.rapidapi.com/v1/geo/"
    static let countries: String = base + "countries"
    static let cities: String = base + "cities"
    static let nearbyCities: String = base + "cities/%@"
}

