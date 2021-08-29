//
//  JSONParser.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation

internal class JSONParser {

    func parseCountries(data: Data?) -> [CountryDTO] {
        let decoder: JSONDecoder = JSONDecoder()
        guard let data = data else { return [] }
        do {
            let countries = try decoder.decode(CountryResponseDTO.self, from: data)
            return countries.data ?? []
        } catch {
            return []
        }
    }

    func parseCities(data: Data?) -> [CityDTO] {
        let decoder: JSONDecoder = JSONDecoder()
        guard let data = data else { return [] }
        do {
            let cities = try decoder.decode(CityResponseDTO.self, from: data)
            return cities.data ?? []
        } catch {
            return []
        }
    }
}
