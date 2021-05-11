//
//  RecipeViewModel.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import Foundation


class RecipeViewModel: Identifiable, ObservableObject {
    
    var id: Int
    var title: String
    var image: String
    var missedIngredients: [Ingredient]
    
    init (recipe: Recipe) {
        self.id = recipe.id
        self.title = recipe.title
        self.image = recipe.image
        self.missedIngredients = recipe.missedIngredients
    }
    
}


