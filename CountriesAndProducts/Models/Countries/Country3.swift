//
//  Country3.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/15/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation
class Country3: BaseCountry {
    

    private(set)var traditionalProducts = [Product]()
    
    init (name: String, averageProducing: [RawMaterial: Int], averageConsumption: [Product: Int], a: Int, traditionalProducts: [Product]) {
        super.init(name: name, averageProducing: averageProducing, averageConsumption: averageConsumption, a: a)
        self.traditionalProducts = traditionalProducts
        produce()
    }
    override func produce() {
        var materials = realNumberProducingRawMaterials
        traditionalProducts.forEach({producedProducts[$0] = 0})
        for (key,value) in realNumberProducingRawMaterials{
            producedProducts[key] = value
        }
        for (key,value) in realNumberConsumptionProducts {
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
                    for (materialKey, materialValue) in key.rawMaterials {
                        
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
