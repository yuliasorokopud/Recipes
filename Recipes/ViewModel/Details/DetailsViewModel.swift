//
//  DetailsViewModel.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import Foundation


class DetailsViewModel: ObservableObject {
    
    @Published var time = String()
    @Published var instructions = String()
    @Published var ingredients = [IngredientViewModel]()
    
    
    var recipe: RecipeViewModel
    private let dataModel:DataModel = DataModel()
    
    
    
    init (recipe: RecipeViewModel) {
        self.recipe = recipe
        loadDetails(recipeId: recipe.id)
    }
    
    
    //fetch details of recipe by id
    public func loadDetails(recipeId: Int){
        dataModel.loadRecipeInfo(id: recipeId){details in
            DispatchQueue.main.async {
                self.time = "\(details.time)"
                self.instructions = details.instructions
                
                details.ingredients.forEach {
                    self.appendIngredients(ingredient: $0)
                }
            }
        }
    }
    
    //add ingredient to the list
    private func appendIngredients(ingredient: Ingredient){
        let ingredientViewModel = IngredientViewModel(ingredient: ingredient)
        DispatchQueue.main.async {
            self.ingredients.append(ingredientViewModel)
        }
    }
    
    
}

