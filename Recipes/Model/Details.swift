//
//  Details.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import Foundation

struct Details: Decodable {
    
    var time: Int
    var ingredients: [Ingredient]
    var instructions: String
    
    enum CodingKeys: String, CodingKey{
        case time = "readyInMinutes"
        case ingredients = "extendedIngredients"
        case instructions
    }
}
