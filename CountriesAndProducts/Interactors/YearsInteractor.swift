//
//  Interactor.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/15/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation

class YearsInteractor: ObservableObject {
    
    init(){
        timelineCountries = timeline()
    }
    
    @Published var timelineCountries = [Int: [BaseCountry]]()
    
    func getChoiceInteractor(for year: Int) -> ChoiceInteractor {
        let countries = timelineCountries[year]!
        let baseProducts = getBalance(countries: countries)
        return .init(year: year, countries: countries, baseProducts: baseProducts)
    }
    
    private func timeline()->[Int: [BaseCountry]]{
        var countries = [Int: [BaseCountry]]()
        let r1 = RawMaterial(n: "Jewelery")
        let r2 = RawMaterial(n: "Petroleum")
        let r3 = RawMaterial(n: "Gold")
        let r4 = RawMaterial(n: "Plants")
        
        let p1 = Product(n: "Crown", rawMaterials: [r1: 10, r3: 4])
        let p2 = Product(n: "Plastics", rawMaterials: [r2: 3, r4:10])
        for i in 2000...2004 {
            if (i == 0) {
                let country1 = Country1(name: "Ukraine", averageProducing: [r1: 30, r2: 20, r3: 5, r4: 123], averageConsumption: [p1:2, p2:9], a: 4 )
                let country2 = Country2(name: "USA", averageProducing: [r1: 15, r2: 10, r3: 12, r4: 2421], averageConsumption: [p1:1, p2:6], a: 4 )
                let country3 = Country3(name: "Brazil", averageProducing: [r1: 50, r2: 10, r3: 70, r4: 100], averageConsumption: [p1:1, p2:1], a: 4, traditionalProducts: [p2] )
                
                let country4 = Country4(name: "Belarus", averageProducing: [r1: 50, r2: 10, r3: 70], averageConsumption: [p1:1, p2:3], a: 4, popularProducts: [p1] )
                countries[i] = []
                countries[i]?.append(country1)
                countries[i]?.append(country2)
                countries[i]?.append(country3)
                countries[i]?.append(country4)
                
            }
            else {
                let country1 = Country1(name: "Ukraine", averageProducing: [r1: 30, r2: 20, r3: 5, r4: 123], averageConsumption: [p1:2, p2:9], a: 4 )
                let country2 = Country2(name: "USA", averageProducing: [r1: 15, r2: 10, r3: 12, r4: 2421], averageConsumption: [p1:1, p2:6], a: 4 )
                let country3 = Country3(name: "Brazil", averageProducing: [r1: 50, r2: 10, r3: 70, r4: 100], averageConsumption: [p1:1, p2:1], a: 4, traditionalProducts: [p2] )
                let country4 = Country4(name: "Belarus", averageProducing: [r1: 50, r2: 10, r3: 70], averageConsumption: [p1:1, p2:1], a: 4, popularProducts: getPopularProducts(countries: countries[i-1] ?? []))
                countries[i] = []
                countries[i]?.append(country1)
                countries[i]?.append(country2)
                countries[i]?.append(country3)
                countries[i]?.append(country4)

                
            }
            
        }
        return countries
    }
    func getPopularProducts(countries: [BaseCountry])->([Product]){
        var products = [BaseProduct: Int]()
        for country in countries{
            for (product,count) in country.importProducts {
                if let a = product as? Product{
                    if(products[a]==nil){
                        products[a] = count
                    }
                    else{
                        products[a]! += count
                    }
                    
                }
            }
            for (product,count) in country.exportProducts {
                if let a = product as? Product{
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
        for (product, count) in products{
            if(count>0){
                popularProducts.append(product as! Product)
            }
        }
        return popularProducts
    }
    func getBalance(countries:[BaseCountry]) -> [BaseProduct:Int] {
        var products = [BaseProduct: Int]()
        for country in countries {
            for (p,count) in country.importProducts {
                
                if(products[p]==nil) {
                    products[p] = count
                }
                else {
                    products[p]! += count
                }
                
                
            }
            for (p,count) in country.exportProducts {
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
