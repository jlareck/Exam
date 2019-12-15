//
//  Country3.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/15/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation
class Country3: BaseCountry {
    
    let name: String
    private(set)var averageNumberProducingRawMaterials: [RawMaterial : Int]
    private(set)var averageNumberConsumptionProducts: [Product : Int]
    private(set)var realNumberProducingRawMaterials = [RawMaterial : Int]()
    private(set)var realNumberConsumptionProducts = [Product : Int]()
    private(set)var exportProducts = [BaseProduct : Int]()
    private(set)var importProducts = [BaseProduct : Int]()
    private(set)var producedProducts = [BaseProduct : Int]()
    private(set)var traditionalProducts = [Product]()
    
    init (name: String, averageProducing: [RawMaterial: Int], averageConsumption: [Product: Int], a: Int, traditionalProducts: [Product]) {
        
        self.name = name
        averageNumberProducingRawMaterials = averageProducing
        averageNumberConsumptionProducts = averageConsumption
        for (key,value) in averageProducing{
            realNumberProducingRawMaterials[key] = value //Int.random(in: value-a..<value+a)
        }
        for (key,value) in averageConsumption{
            realNumberConsumptionProducts[key] = value //Int.random(in: value-a..<value+a)
        }
        self.traditionalProducts = traditionalProducts
        produce()
    }
    private func produce() {
        //var consumedProducts = realNumberConsumptionProducts // товари які в ідеалі треба виготовити
        var materials = realNumberProducingRawMaterials // матеріали які є
        // var producedProducts = [Product: Int]() // товари які виготовляться з матеріалу
        
        traditionalProducts.forEach({producedProducts[$0] = 0})
        
        for (key,value) in realNumberConsumptionProducts {// продукти які треба виробити і їхня кількість
            var count = 0
            var checkIfIsDeficit = false
            if (!traditionalProducts.contains(key)) {
                importProducts[key] = value
            }
            else {
                while(count < value ) {
                    var flag: Bool = true
                    if (checkIfIsDeficit){
                        break;
                    }
                    for (materialKey, materialValue) in key.rawMaterials {// матеріали для кожного продукту і потрібана кількість, якщо з сировини хватає то
                        
                        if(materials[materialKey] == nil){
                            if (importProducts[materialKey] == nil){
                                importProducts[materialKey] = materialValue + (value-count-1)*materialValue
                                checkIfIsDeficit = true
                            }
                            else{
                                importProducts[materialKey]! += materialValue + (value-count-1)*materialValue
                            }
                        }
                        else if (materialValue > materials[materialKey]!){
                            if (importProducts[materialKey] == nil){
                                importProducts[materialKey] = materialValue - materials[materialKey]! + (value-count-1)*materialValue
                                checkIfIsDeficit = true
                            }
                            else{
                                importProducts[materialKey]! += materialValue - materials[materialKey]! + (value-count-1)*materialValue
                            }
                            materials[materialKey] = 0
                            flag = false
                            break;
                        }
                        else{
                            materials[materialKey]! -= materialValue
                        }
                    }
                    if (flag){
                        producedProducts[key]!+=1
                    }
                    count+=1
                }
                var checkIfImportIsOnlyRawMaterial = true
                for (key,_) in importProducts{
                    if(key is RawMaterial){
                        checkIfImportIsOnlyRawMaterial = false
                    }
                }
                if(checkIfImportIsOnlyRawMaterial) {
                    
                    for t in traditionalProducts {
                        var checkIfCurrentProductCanBeProduced = true
                        while(checkIfCurrentProductCanBeProduced){
                            for (materialKey, materialValue) in t.rawMaterials {
                                if(materialValue > materials[materialKey]!){
                                    checkIfCurrentProductCanBeProduced = false
                                    break;
                                }
                                else {
                                    materials[materialKey]! -= materialValue
                                }
                            }
                            if(checkIfCurrentProductCanBeProduced){
                                if(exportProducts[t]==nil){
                                    exportProducts[t] = 1
                                }
                                else{
                                    exportProducts[t]! += 1
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
}
