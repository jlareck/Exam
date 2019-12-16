//
//  CountryView.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/15/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import SwiftUI

struct CountryView: View {
    struct ViewModel: Identifiable {
        let id = UUID()
        let sectionName: String
        let baseViewModels: [ProductDetailViewModel]
    }
    let countryName: String
    let viewModels: [ViewModel]
    var body: some View {
        List {
            ForEach(viewModels) { (viewModel) in
                Section(header: Text(viewModel.sectionName)) {
                    ForEach(viewModel.baseViewModels) { baseViewModel in
                        Text(baseViewModel.description)
                    }
                }
            }
        }.navigationBarTitle(countryName)
    }
}
