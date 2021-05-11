//
//  DetailsViewModel.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import Foundation
import SwiftUI




class DetailsViewModel: ObservableObject {
    
    @Published var time = String()
    @Published var ingredients = [IngredientViewModel]()
//    @Published var instructions = [Step]()
    
    var recipe: RecipeViewModel
    private let dataModel:DataModel = DataModel()
    
    
    
    init (recipe: RecipeViewModel) {
        self.recipe = recipe
        loadDetails(recipeId: recipe.id)
    }
    
    
    //fetch details of current recipe
    public func loadDetails(recipeId: Int){
           dataModel.loadRecipeInfo(id: recipeId){details in
            DispatchQueue.main.async {
                self.time = "\(details.time)"
//                self.instructions = details.instructions
                
                details.ingredients.forEach {
                    self.appendIngredients(ingredient: $0)
                }
            }
        }
        
        print(" RECIPE NAME: \(self.recipe.title)")
        print(" RECIPE ID: \(self.recipe.id)")
//        print(" TIME: \(self.time)")
        print(" INGREDIENTS: \(self.ingredients)")
//        print(" INSTRUCTIONS: \(self.instructions)\n\n")
    }
    
    //add ingredient to the ingredient view model list
    private func appendIngredients(ingredient: Ingredient){
        let ingredientViewModel = IngredientViewModel(ingredient: ingredient)
        DispatchQueue.main.async {
            self.ingredients.append(ingredientViewModel)
        }
    }
   
}

