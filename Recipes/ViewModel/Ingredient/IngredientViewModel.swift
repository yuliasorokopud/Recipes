//
//  IngredientViewModel.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import Foundation


class IngredientViewModel: Identifiable, ObservableObject {

    
    var id: Int
    var name: String
    var amount: String
    var unit: String
    
    init (ingredient: Ingredient) {
        self.id = ingredient.id
        self.name = ingredient.name
        self.amount = String(format: "%g", ingredient.amount)
        self.unit = ingredient.unit
    }
    
}


