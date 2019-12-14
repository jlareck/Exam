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
            realNumberProducingRawMaterials[key] = Int.random(in: value-a..<value+a)
        }
        for (key,value) in averageConsumption{
            realNumberConsumptionProducts[key] = Int.random(in: value-a..<value+a)
        }
        exportProducts = realNumberProducingRawMaterials
        importProducts = realNumberConsumptionProducts
    }
    func produce()->(){
        //var consumedProducts = realNumberConsumptionProducts // товари які в ідеалі треба виготовити
        //var materials = realNumberProducingRawMaterials // матеріали які є
       // var producedProducts = [Product: Int]() // товари які виготовляться з матеріалу
        
        for (key,_) in realNumberConsumptionProducts{
            producedProducts[key] = 0
        }
        
        for (key,value) in realNumberConsumptionProducts{// продукти які треба виробити і їхня кількість
            var count = 0
            
            while(count < value){
                var flag: Bool = true
                for (materialKey, materialValue) in key.rawMaterials{// матеріали для кожного продукту і потрібана кількість, якщо з сировини хватає то
                    //producedProducts[key]!+=1
                    if (materialValue > realNumberProducingRawMaterials[materialKey]!){
                        importProducts[materialKey]! += materialValue - realNumberProducingRawMaterials[materialKey]! + (value-count-1)*materialValue
                        flag = false
                        break;
                    }
                    else{
                        realNumberProducingRawMaterials[materialKey]! -= materialValue
                    }
                }
                if (flag){
                     producedProducts[key]!+=1
                }
                count+=1
            }
        }
        
        for (key, value) in realNumberProducingRawMaterials{
            if (value > 0){
                exportProducts[key] = value
            }
        }
 
    }
}
