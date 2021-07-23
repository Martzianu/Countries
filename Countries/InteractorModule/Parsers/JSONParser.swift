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
        print(String(decoding: data, as: UTF8.self))
        do {
            let countries = try decoder.decode(CountryResponseDTO.self, from: data)
            return countries.data ?? []
        } catch {
            return []
        }
    }
}
