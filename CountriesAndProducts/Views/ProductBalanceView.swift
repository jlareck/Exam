//
//  ProductBalanceView.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/15/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import SwiftUI

struct ProductBalanceView: View {
    
    let viewModels: [ProductDetailViewModel]
    var body: some View {
        List(viewModels) { viewModel in
            Text(viewModel.description)
        }.navigationBarTitle("Product Balance")
    }
}

//struct ProductBalanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductBalanceView()
//    }
//}
