//
//  CityView.swift
//  Countries
//
//  Created by Marcean, Dragos on 8/30/21.
//

import SwiftUI

struct CitiesListView: View {
    @State var country: Country
    @State var cities: [City] = []
    let viewModel: ScreensViewModel = ScreensViewModel()
    @State var isLoading: Bool = false

    var body: some View {
        ZStack {
            List(cities) { city in
                Text("\(city.name)") 
            }
            .navigationTitle(country.name)
            .onAppear() {
                fetchCities()
            }
            if isLoading {
                LoadingView()
            }
        }
    }

    private func fetchCities() {
        isLoading = true
        viewModel.fetchCitiesFrom(coutryId: country.id)
            .then { cities in
                self.cities = cities
            }
            .catch { _ in
                /// show error view
            }
            .always {
                isLoading = false
            }
    }

}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesListView(country: Country(id: "0", name: "Pailanda"))
    }
}
