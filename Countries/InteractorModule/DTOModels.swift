//
//  BusinessModels.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation

struct CountryResponseDTO: Codable {
    let data: [CountryDTO]?
}

struct CountryDTO: Codable {
    let code: String?
    let currencyCodes: [String]?
    let name, wikiDataId: String?

}

struct CityResponseDTO: Codable {
    let data: [CityDTO]?
}

struct CityDTO: Codable {
    var wikiDataId: String
    var name: String
    var region: String
    var country: String
    var latitude: Double
    var longitude: Double
    var population: Double
}
