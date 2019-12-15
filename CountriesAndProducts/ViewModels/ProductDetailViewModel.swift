//
//  ProductDetailViewModel.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/15/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation

struct ProductDetailViewModel: Identifiable, CustomStringConvertible {
    let id: Int
    let product: String
    let balance: Int
    var description: String {
        product + ": \(balance)"
    }
    static func buildViewModels(for baseProducts: [BaseProduct: Int]) -> [ProductDetailViewModel] {
        var viewModels = [ProductDetailViewModel]()
        for (i, key) in baseProducts.keys.enumerated() {
            viewModels.append(ProductDetailViewModel.init(id: i, product: key.name, balance: baseProducts[key]!))
        }
        return viewModels
    }
}
