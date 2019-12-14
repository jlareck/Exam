//
//  BaseCountry.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/14/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation

protocol BaseCountry{
    var name: String { get set }
    var averageNumberProducingRawMaterials: [RawMaterial: Int] { get set }
    var averageNumberConsumptionProducts: [Product: Int] { get set }
    var realNumberProducingRawMaterials: [RawMaterial: Int] { get set }
    var realNumberConsumptionProducts: [Product: Int] { get set }
    var exportProducts: [BaseProduct: Int]  { get set }
    var importProducts: [BaseProduct: Int] { get set }
    var producedProducts: [BaseProduct: Int] { get set }
}
