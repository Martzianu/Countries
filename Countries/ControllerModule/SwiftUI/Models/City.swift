//
//  City.swift
//  Countries
//
//  Created by Marcean, Dragos on 8/30/21.
//

import Foundation

struct City: Identifiable, Hashable {
    var id: String
    var coutryName: String
    var name: String
    var region: String
    var population: Double
    var elevation: Int
    var lat: Double
    var long: Double

    init(id: String, coutryName: String, name: String, region: String, population: Double, elevation: Int, lat: Double, long: Double) {
        self.id = id
        self.coutryName = coutryName
        self.name = name
        self.region = region
        self.population = population
        self.elevation = elevation
        self.lat = lat
        self.long = long
    }

}
