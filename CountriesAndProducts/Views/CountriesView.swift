//
//  CountriesView.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/15/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import SwiftUI

struct CountriesView: View {
    struct ViewModel: Identifiable {
        let id: Int
        let country: BaseCountry
    }
    let viewModels: [ViewModel]
    
    var body: some View {
        List.init(viewModels) { viewModel in
            NavigationLink.init(viewModel.country.name, destination: CountryView.init(countryName: viewModel.country.name, viewModels: self.buildCountryViewModels(for: viewModel.country)))
        }.navigationBarTitle("Countries")
    }
    private func buildCountryViewModels(for country: BaseCountry) -> [CountryView.ViewModel] {
        var countryViewModels = [CountryView.ViewModel]()
        
        countryViewModels.append(CountryView.ViewModel.init(sectionName: "Imported ", baseViewModels: ProductDetailViewModel.buildViewModels(for: country.importProducts)))
        countryViewModels.append(CountryView.ViewModel.init(sectionName: "Exported ", baseViewModels: ProductDetailViewModel.buildViewModels(for: country.exportProducts)))
        countryViewModels.append(CountryView.ViewModel.init(sectionName: "Produced ", baseViewModels: ProductDetailViewModel.buildViewModels(for: country.producedProducts)))

        return countryViewModels
    }
}

