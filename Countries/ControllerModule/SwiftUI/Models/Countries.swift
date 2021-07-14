//
//  Countries.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/26/21.
//

import Foundation

class Countries: ObservableObject {

    init() {
        let vm = ScreensViewModel()
        vm.getCountries()
    }
}
