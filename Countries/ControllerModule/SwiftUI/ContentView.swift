//
//  ContentView.swift
//  Countries
//
//  Created by Marcean, Dragos on 5/25/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        WindowGroup {
            TabView {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
