//
//  BaseCountry.swift
//  CountriesAndProducts
//
//  Created by Mykola Medynsky on 12/14/19.
//  Copyright © 2019 Mykola Medynskyi. All rights reserved.
//

import Foundation

protocol BaseCountry {
    var name: String { get }
    var averageNumberProducingRawMaterials: [RawMaterial: Int] { get }
    var averageNumberConsumptionProducts: [Product: Int] { get }
    var realNumberProducingRawMaterials: [RawMaterial: Int] { get }
    var realNumberConsumptionProducts: [Product: Int] { get }
    var exportProducts: [BaseProduct: Int]  { get }
    var importProducts: [BaseProduct: Int] { get }
    var producedProducts: [BaseProduct: Int] { get }
}
