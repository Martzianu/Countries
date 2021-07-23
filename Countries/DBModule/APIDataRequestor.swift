//
//  APIDataRequestor.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//


/// interface with all the calls we need from the API

import Promises

enum APIErrors: Error {
    case invalidRequest
    case noData
}

protocol APIDataRequestor {
    func fetchCountries() -> Promise<Data?>
}
