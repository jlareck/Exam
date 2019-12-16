//
//  Country1.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/14/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation
class Country1: BaseCountry {

    let name: String
    private(set)var averageNumberProducingRawMaterials: [RawMaterial: Int]
    private(set)var averageNumberConsumptionProducts: [Product: Int]
    private(set)var realNumberProducingRawMaterials = [RawMaterial: Int]()
    private(set)var realNumberConsumptionProducts = [Product: Int]()
    private(set)var exportProducts = [BaseProduct: Int]()
    private(set)var importProducts = [BaseProduct: Int]()
    private(set)var producedProducts = [BaseProduct: Int]()
    
    init(name: String, averageProducing: [RawMaterial: Int], averageConsumption: [Product: Int], a: Int) {
       self.name = name
        averageNumberProducingRawMaterials = averageProducing
        averageNumberConsumptionProducts = averageConsumption
        for (key,value) in averageProducing{
            realNumberProducingRawMaterials[key] = averageProducing[key]//Int.random(in: value-a..<value+a)
        }
        for (key,value) in averageConsumption{
            realNumberConsumptionProducts[key] = averageConsumption[key]//Int.random(in: value-a..<value+a)
        }
        exportProducts = realNumberProducingRawMaterials
        importProducts = realNumberConsumptionProducts
        producedProducts = realNumberProducingRawMaterials
    }
    
}
