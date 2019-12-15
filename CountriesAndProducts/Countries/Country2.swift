//
//  Country2.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/14/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation

class Country2: BaseCountry{
    
    var name: String
    
    var averageNumberProducingRawMaterials: [RawMaterial : Int]
    
    var averageNumberConsumptionProducts: [Product : Int]
    
    var realNumberProducingRawMaterials = [RawMaterial : Int]()
    
    var realNumberConsumptionProducts = [Product : Int]()
    
    var exportProducts = [BaseProduct : Int]()
    
    var importProducts = [BaseProduct : Int]()
    
    var producedProducts = [BaseProduct : Int]()
    
  
    
    init (name: String, averageProducing: [RawMaterial: Int], averageConsumption:[Product: Int], a:Int) {
        
        self.name = name
        averageNumberProducingRawMaterials = averageProducing
        averageNumberConsumptionProducts = averageConsumption
        for (key,value) in averageProducing{
            realNumberProducingRawMaterials[key] = value //Int.random(in: value-a..<value+a)
        }
        for (key,value) in averageConsumption{
            realNumberConsumptionProducts[key] = value //Int.random(in: value-a..<value+a)
        }
        produce()
    }
    func produce() {
       // var consumedProducts = realNumberConsumptionProducts // товари які в ідеалі треба виготовити
        var materials = realNumberProducingRawMaterials // матеріали які є
       // var producedProducts = [Product: Int]() // товари які виготовляться з матеріалу
        
        for (key,_) in realNumberConsumptionProducts{
            producedProducts[key] = 0
        }
        
        for (key,value) in realNumberConsumptionProducts{// продукти які треба виробити і їхня кількість
            var count = 0
            var checkIfIsDeficit = false
            while(count < value){
                var flag: Bool = true
                if (checkIfIsDeficit){
                    break;
                }
                for (materialKey, materialValue) in key.rawMaterials{// матеріали для кожного продукту і потрібана кількість, якщо з сировини хватає то
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
