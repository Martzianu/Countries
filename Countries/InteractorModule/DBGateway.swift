//
//  DBGateway.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation
import Promises
//import DBModule

internal enum APIRequestorTypes {
    case urlSession
    case alamofire
    case cache
    case mock
}

internal class DBGateway {
    /// can use any of the DB Module requestors as they all do the same thing, but using different technologies
    private var requestor: APIDataRequestor

    private var internetConnection: Bool = true

    init(requestorType: APIRequestorTypes = .urlSession) {
        guard self.internetConnection else {
            self.requestor = CacheRequestor()
            return
        }

        switch requestorType {
        case .urlSession:
            self.requestor = URLSessionRequestor()
        case .alamofire:
            self.requestor = AlamofireRequestor()
        case .cache:
            self.requestor = CacheRequestor()
        case .mock:
            self.requestor = MockRequestor()
        }
    }

    func fetchCountries() -> Promise<Data?> {
        self.requestor.fetchCountries()
    }
}
