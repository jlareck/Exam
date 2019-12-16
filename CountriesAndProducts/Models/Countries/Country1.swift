//
//  Country1.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/14/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation
class Country1: BaseCountry {

    override init(name: String, averageProducing: [RawMaterial: Int], averageConsumption: [Product: Int], a: Int) {
        
        super.init(name: name, averageProducing: averageProducing, averageConsumption: averageConsumption, a: a)
        self.produce()

    }
    
    override func produce(){
        exportProducts = realNumberProducingRawMaterials
        importProducts = realNumberConsumptionProducts
        producedProducts = realNumberProducingRawMaterials
    }
    
    
}
