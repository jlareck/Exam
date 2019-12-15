//
//  Interactor.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/15/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation

final class Interactor{
    private init(){}
    static let shared = Interactor.init()
    var timelineCountries = [Int: [BaseCountry]]()
    func timeline(){
        let r1 = RawMaterial(n: "R1")
        let r2 = RawMaterial(n: "R2")
        let r3 = RawMaterial(n: "R3")
        let p1 = Product(n: "P1", rawMaterials: [r1: 10, r3: 4])
        let p2 = Product(n: "P2", rawMaterials: [r2: 3])
        for i in 0...4{
            if (i == 0){
                let country1 = Country1(name: "C1", averageProducing: [r1: 30, r2: 20, r3: 5], averageConsumption: [p1:2, p2:1], a: 4 )
                let country2 = Country2(name: "C2", averageProducing: [r1: 15, r2: 10, r3: 12], averageConsumption: [p1:1, p2:1], a: 4 )
                let country3 = Country3(name: "C3", averageProducing: [r1: 50, r2: 10, r3: 70], averageConsumption: [p1:1, p2:1], a: 4, traditionalProducts: [p1] )
                
                let country4 = Country4(name: "C4", averageProducing: [r1: 50, r2: 10, r3: 70], averageConsumption: [p1:1, p2:1], a: 4, popularProducts: [p1] )
                timelineCountries[i] = []
                timelineCountries[i]?.append(country1)
                timelineCountries[i]?.append(country2)
                timelineCountries[i]?.append(country3)
                timelineCountries[i]?.append(country4)
                
            }
            else{
                let country1 = Country1(name: "C1", averageProducing: [r1: 30, r2: 20, r3: 5], averageConsumption: [p1:2, p2:1], a: 4 )
                let country2 = Country2(name: "C2", averageProducing: [r1: 15, r2: 10, r3: 12], averageConsumption: [p1:1, p2:1], a: 4 )
                let country3 = Country3(name: "C3", averageProducing: [r1: 50, r2: 10, r3: 70], averageConsumption: [p1:1, p2:1], a: 4, traditionalProducts: [p1] )
                
                let country4 = Country4(name: "C4", averageProducing: [r1: 50, r2: 10, r3: 70], averageConsumption: [p1:1, p2:1], a: 4, popularProducts: getPopularProducts(countries: timelineCountries[i-1] ?? []))
                timelineCountries[i] = []
                timelineCountries[i]?.append(country1)
                timelineCountries[i]?.append(country2)
                timelineCountries[i]?.append(country3)
                timelineCountries[i]?.append(country4)

                
            }
        }
        var a = getBalance(countries: timelineCountries[1]!)
        for (product, count) in a{
            print(product.name + "  \(count)")
        }
    }
    func getPopularProducts(countries:[BaseCountry])->([Product]){
        var products = [BaseProduct: Int]()
        for country in countries{
            for (p,count) in country.importProducts{
                if let a = p as? Product{
                    if(products[a]==nil){
                        products[a] = count
                    }
                    else{
                        products[a]! += count
                    }
                    
                }
            }
            for (p,count) in country.exportProducts{
                if let a = p as? Product{
                    if(products[a]==nil){
                        products[a] = -count
                    }
                    else{
                        products[a]! -= count
                    }
                }
            }
        }
        var popularProducts = [Product]()
        for (p, count) in products{
            if(count>0){
                popularProducts.append(p as! Product)
            }
        }
        return popularProducts
    }
    func getBalance(countries:[BaseCountry])->([BaseProduct:Int]) {
        var products = [BaseProduct: Int]()
        for country in countries {
            for (p,count) in country.importProducts{
                
                if(products[p]==nil) {
                    products[p] = count
                }
                else {
                    products[p]! += count
                }
                
                
            }
            for (p,count) in country.exportProducts{
                if(products[p]==nil) {
                    products[p] = -count
                }
                else {
                    products[p]! -= count
                }
            }
        }
        for (p, count) in products{
            if(count<0){
                products[p]!*=(-1)
            }
        }
        return products
    }
    
}
