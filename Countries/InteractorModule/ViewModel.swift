//
//  ViewModel.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation
import Promises

public class ViewModel {

    private let requestor: Requestor = Requestor()

    func fetchCountries() -> Promise<[Country]> {
        return self.requestor.fetchCountries()
            .then { countryDTO in
                self.parseCountries(dto: countryDTO)
            }
            .catch { _ in
                //notify ui of error
                print("ERROR! ERROR! ERROR! ERROR!")
            }
    }

    private func parseCountries(dto: [CountryDTO]) -> Promise<[Country]> {
        var array: [Country] = []
        for country in dto {
            array.append(Country(id: country.wikiDataId ?? "--", name: country.name ?? "Unknown"))
        }

        return Promise(array)
    }
}
