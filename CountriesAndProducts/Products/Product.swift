//
//  Product.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/14/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation
class Product: BaseProduct{
    var rawMaterials: [RawMaterial: Int]

    init(n: String, rawMaterials: [RawMaterial: Int]){


        self.rawMaterials = rawMaterials
        super.init(name: n)
    }
    
    
}
