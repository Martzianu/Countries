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

    func fetchCitiesFrom(coutryId: String) -> Promise<[City]> {
        return self.requestor.fetchCitiesFor(countriesIds: [coutryId])
            .then { citiesDTO in
                self.parseCities(dto: citiesDTO)
            }
            .catch { _ in
                print("ERROR!")
            }
    }

    private func parseCities(dto: [CityDTO]) -> Promise<[City]> {
        var array: [City] = []
        for city in dto {
            array.append(City(id: city.wikiDataId,
                              coutryName: city.country,
                              name: city.name,
                              region: city.region,
                              population: city.population,
                              lat: city.latitude,
                              long: city.longitude))
        }

        return Promise(array)
    }
}
