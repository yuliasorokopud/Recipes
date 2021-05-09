//
//  Ingredient.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import Foundation

struct Ingredient: Identifiable, Decodable, Hashable {
    
    var id: Int
    var name: String
    var original: String
    var amount: Double
    var unit: String
    
//    enum CodingKeys: String, CodingKey{
//        case id
//        case name
//        case original
//        case amount
//        case unit
//    }
    
}


//"id": 10014355,
//        "original": "1 cup green tea",
//        "originalName": "green tea",
//        "name": "tea",
//        "nameClean": "green tea",
//        "amount": 1.0,
//        "unit": "cup",
//        "unitShort": "cup",
//        "unitLong": "cup",
