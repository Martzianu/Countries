//
//  CountriesApp.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import SwiftUI

@main
struct CountriesApp: App {
    @StateObject var countries = Countries()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
