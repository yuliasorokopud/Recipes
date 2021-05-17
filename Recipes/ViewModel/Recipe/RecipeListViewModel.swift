//
//  RecipeListViewModel.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import Foundation

class RecipeListViewModel: ObservableObject {
    //MARK: properties
    @Published var recipeList = [RecipeViewModel]()
    private let dataModel:DataModel = DataModel()
    
    //MARK: - initializer
    init(ingredients: [String]){
        loadRecipes(ingredients: ingredients)
    }
    
    //fetch recipes by ingredients
    public func loadRecipes(ingredients: [String]){
        dataModel.loadRecipes(ingredients: ingredients) { recipes in
            recipes?.forEach { self.appendRecipe(recipe: $0)
            }
        }
        
    }
    
    //add recipe to the list
    private func appendRecipe(recipe: Recipe){
        let recipeViewModel = RecipeViewModel(recipe: recipe)
        DispatchQueue.main.async {
            self.recipeList.append(recipeViewModel)
        }
    }
}


