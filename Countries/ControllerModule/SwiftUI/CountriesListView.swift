//
//  CountriesListView.swift
//  Countries
//
//  Created by Marcean, Dragos on 8/29/21.
//

import SwiftUI

struct CountriesListView: View {
    @State var countries: [Country] = []
    @State private var isLoading: Bool = false

    let viewModel: ScreensViewModel = ScreensViewModel()
    var body: some View {
        ZStack {
            List(countries, id: \.self) { country in
                NavigationLink(destination: CitiesListView(country: country)) {
                    Text(country.name)
                }
            }
            .onAppear() {
                isLoading = true
                getCountries()
            }
            if isLoading {
                LoadingView()
            }
        }
    }

    func getCountries() {
        viewModel.fetchCountries()
            .then { countries in
                self.countries = countries
            }
            . catch { _ in
                /// show some error thingy
            }
            .always {
                isLoading = false
            }
    }

}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
