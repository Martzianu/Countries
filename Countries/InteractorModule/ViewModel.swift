//
//  ViewModel.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation
import Promises

public class ViewModel {
    //TODO: Implement Promises. See where at what level they are best

    private let requestor: Requestor = Requestor()

    func fetchCountries() -> Promise<Void> {
        return self.requestor.fetchCountries()
            .then { countries in
                countries.forEach { c in
                    print(c.name ?? "")
                }
                // notify ui
            }
            .catch { _ in
                //notify ui of error
                print("ERROR! ERROR! ERROR! ERROR!")
            }
    }
}
