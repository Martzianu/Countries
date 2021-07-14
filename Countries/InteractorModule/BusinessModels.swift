//
//  BusinessModels.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation

struct Country {
    var id: Int
    var name: String
    var cities: [City]
}

struct City {
    var id: Int
    var name: String
}
