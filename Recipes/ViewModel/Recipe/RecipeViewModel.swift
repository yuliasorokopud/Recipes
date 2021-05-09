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
//    var missedIngredients = [IngredientViewModel]()
    
    init (recipe: Recipe) {
        self.id = recipe.id
        self.title = recipe.title
        self.image = recipe.image
        self.missedIngredients = recipe.missedIngredients

//        self.missedIngredients = toIngredientViewModel(ingredients: recipe.missedIngredients)
    }
    
    
    //TODO: clean
    public func toIngredientViewModel(ingredients: [Ingredient]) -> [IngredientViewModel]{
        var ingredientViewModel = [IngredientViewModel]()
        ingredients.forEach{ingredient in
            ingredientViewModel.append(IngredientViewModel(ingredient: ingredient))
            }
        return ingredientViewModel
    }
    
    
}

