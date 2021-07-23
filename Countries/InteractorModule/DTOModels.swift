//
//  BusinessModels.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation

// MARK: - CountryResponseDTO
struct CountryResponseDTO: Codable {
    let data: [CountryDTO]?
}

// MARK: - Datum
struct CountryDTO: Codable {
    let code: String?
    let currencyCodes: [String]?
    let name, wikiDataID: String?

}

struct City: Codable {
    var id: Int
    var name: String
}
