//
//  BaseCountry.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/14/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation

class BaseCountry {
    let name: String
    let averageNumberProducingRawMaterials: [RawMaterial: Int]
    let averageNumberConsumptionProduct: [Product: Int]
    private(set)var realNumberProducingRawMaterials = [RawMaterial: Int]()
    private(set)var realNumberConsumptionProducts = [Product: Int]()
    var exportProducts = [BaseProduct: Int]()
    var importProducts = [BaseProduct: Int]()
    var producedProducts = [BaseProduct: Int]()
    func produce(){
        fatalError()
    }
    init(name: String, averageProducing: [RawMaterial: Int], averageConsumption: [Product: Int], a: Int){
        self.name = name
        self.averageNumberProducingRawMaterials = averageProducing
        self.averageNumberConsumptionProduct = averageConsumption
        for (key,_) in averageProducing{
            self.realNumberProducingRawMaterials[key] = averageProducing[key]//Int.random(in: value-a..<value+a)
        }
        for (key,_) in averageConsumption{
            self.realNumberConsumptionProducts[key] = averageConsumption[key]//Int.random(in: value-a..<value+a)
        }
    }
}
