//
//  BaseProduct.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/14/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation
class BaseProduct: Hashable {
    var name: String
    init(name:String){
        self.name = name
    }
    static func == (lhs: BaseProduct, rhs: BaseProduct) -> Bool {
        return lhs.name == rhs.name
    }
    func hash(into hasher: inout Hasher) {
         hasher.combine(name)
     }
    
}
