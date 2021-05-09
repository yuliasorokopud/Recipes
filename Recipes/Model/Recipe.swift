//
//  File.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import Foundation

struct Recipe: Identifiable, Decodable {
    
    var id: Int
    var title: String
    var image: String
    var missedIngredients: [Ingredient]

}
