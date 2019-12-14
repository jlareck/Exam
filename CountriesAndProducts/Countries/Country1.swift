//
//  Country1.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/14/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation

class Country1: BaseCountry{

    
    var name: String
    
    var averageNumberProducingRawMaterials: [RawMaterial: Int]
    
    var averageNumberConsumptionProducts: [Product: Int]
    
    var realNumberProducingRawMaterials = [RawMaterial: Int]()
    
    var realNumberConsumptionProducts = [Product: Int]()
    
    var exportProducts = [BaseProduct: Int]()
    
    var importProducts = [BaseProduct: Int]()
    
    var producedProducts = [BaseProduct: Int]()
    
    
   internal init(name: String,averageProducing: [RawMaterial: Int], averageConsumption:[Product: Int], a:Int) {
       self.name = name
        averageNumberProducingRawMaterials = averageProducing
        averageNumberConsumptionProducts = averageConsumption
        for (key,value) in averageProducing{
            realNumberProducingRawMaterials[key] = Int.random(in: value-a..<value+a)
        }
        for (key,value) in averageConsumption{
            realNumberConsumptionProducts[key] = Int.random(in: value-a..<value+a)
        }
        exportProducts = realNumberProducingRawMaterials
        importProducts = realNumberConsumptionProducts
   }
//
//    init (name: String, averageProducing: [RawMaterial: Int], averageConsumption:[Product: Int], a:Int) {
//
//        self.name = name
//        averageNumberProducingRawMaterials = averageProducing
//        averageNumberConsumptionProducts = averageConsumption
//        for (key,value) in averageProducing{
//            realNumberProducingRawMaterials[key] = Int.random(in: value-a..<value+a)
//        }
//        for (key,value) in averageConsumption{
//            realNumberConsumptionProducts[key] = Int.random(in: value-a..<value+a)
//        }
////        realNumberProducingRawMaterials = averageNumberProducingRawMaterials.map{
////            (material) ->(Int) in
////            return (Int.random(in: material-a..<material.1+a))
////        }
////
////        realNumberConsumptionProducts = averageNumberConsumptionProducts.map{
////            (product) ->(Product, Int) in
////            return (product.0, Int.random(in: product.1-a..<product.1+a))
////        }
//

//    }
    
}
