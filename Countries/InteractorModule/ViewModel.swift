//
//  ViewModel.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import Foundation

public class ViewModel {
    //TODO: Implement Promises. See where at what level they are best

    private let requestor: Requestor = Requestor()

    func getCountries() -> [Country] {
        return self.requestor.getCountries()
    }

}
