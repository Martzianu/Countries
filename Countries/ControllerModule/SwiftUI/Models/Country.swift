//
//  Countries.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/26/21.
//

import Foundation

struct Country: Identifiable {
    var id: String = ""
    var name: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
