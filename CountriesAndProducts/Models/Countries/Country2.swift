//
//  Country2.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/14/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation
class Country2: BaseCountry {
    

    
    override init(name: String, averageProducing: [RawMaterial: Int], averageConsumption: [Product: Int], a: Int) {
        super.init(name: name, averageProducing: averageProducing, averageConsumption: averageConsumption, a: a)
        
        produce()
    }
    override func produce() {
      
        var materials = realNumberProducingRawMaterials
      
        
        for (key,_) in realNumberConsumptionProducts{
            producedProducts[key] = 0
        }
        for (key,value) in realNumberProducingRawMaterials{
            producedProducts[key] = value
        }
        
        
        for (key,value) in realNumberConsumptionProducts{
            var count = 0
            var checkIfIsDeficit = false
            while(count < value){
                var flag: Bool = true
                if (checkIfIsDeficit){
                    break;
                }
                for (materialKey, materialValue) in key.rawMaterials{
                    //producedProducts[key]!+=1
                    if(materials[materialKey]==nil){
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
                count += 1
            }
        }
        
        for (key, value) in materials{
            if (importProducts[key] == nil){
                if (!(value==0)){
                    exportProducts[key] = value
                }
       
            }
        }
 
    }
}
