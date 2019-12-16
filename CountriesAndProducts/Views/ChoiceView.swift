//
//  ChoiceView.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/15/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import SwiftUI

struct ChoiceView: View {
    @ObservedObject var interactor: ChoiceInteractor
    var body: some View {
        VStack(alignment: .center, spacing: 40, content: {
            NavigationLink.init(destination: CountriesView.init(viewModels: self.interactor.countriesViewModels)) {
                Text("Countries").font(.system(size: 40))
            }
            NavigationLink.init(destination: ProductBalanceView.init(viewModels: self.interactor.productBalanceViewModels)) {
                Text("Product balances").font(.system(size: 40))
            }
            }).navigationBarTitle("Select action")
    }
}
