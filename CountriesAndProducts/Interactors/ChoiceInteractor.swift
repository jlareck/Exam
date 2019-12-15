//
//  ChoiceInteractor.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/15/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation

class ChoiceInteractor: ObservableObject {
    
    let year: Int
    let countries: [BaseCountry]
    let baseProducts: [BaseProduct: Int]
    
    init(year: Int, countries: [BaseCountry], baseProducts: [BaseProduct: Int]) {
        self.year = year
        self.countries = countries
        self.baseProducts = baseProducts
    }
    
    var countriesViewModels: [CountriesView.ViewModel] {
        var viewModels = [CountriesView.ViewModel]()
        for (i, element) in countries.enumerated() {
            viewModels.append(CountriesView.ViewModel.init(id: i, country: element))
        }
        return viewModels
    }
    
    var productBalanceViewModels: [ProductDetailViewModel] {
        return ProductDetailViewModel.buildViewModels(for: baseProducts)
    }
    
}
