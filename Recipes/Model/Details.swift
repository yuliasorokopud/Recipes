//
//  Details.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import Foundation

//Get Recipe Information

struct Details: Decodable {

    var readyInMinutes: Int
    var extendedIngredients: [Ingredient]
    var instructions: Instructions
    
}
