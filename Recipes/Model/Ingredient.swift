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
    
    
}
