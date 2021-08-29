//
//  CountriesApp.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import SwiftUI

@main
struct CountriesApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    WelcomeView()
                }
                .tabItem {
                    Image (systemName: "house")
                    Text ("Home")
                }
                NavigationView {
                    CountriesListView()
                }
                .tabItem {
                    Image (systemName: "list.bullet")
                    Text ("Countries")
                }

                NavigationView {
                    CountriesMapView()
                }
                .tabItem {
                    Image (systemName: "map")
                    Text ("Map")
                }
            }
        }
    }
}
