//
//  DetailsViewModel.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import Foundation
import SwiftUI




class DetailsViewModel: ObservableObject {
    
    var time: String
    var ingredients = [IngredientViewModel]()
    var instructions = [StepViewModel]()
    
    init (details: Details) {
        self.time =  String(format: "%g", details.time)
        self.instructions = toInstructionsViewModel(instructions: details.instructions.steps)
        self.ingredients = toIngredientViewModel(ingredients: details.ingredients)
    }
   
    
    //TODO: clean
    public func toIngredientViewModel(ingredients: [Ingredient]) -> [IngredientViewModel]{
        var ingredientViewModel = [IngredientViewModel]()
        ingredients.forEach{ingredient in
            ingredientViewModel.append(IngredientViewModel(ingredient: ingredient))
            }
        return ingredientViewModel
    }
    
    public func toInstructionsViewModel(instructions: [Step]) -> [StepViewModel]{
        var instructionsViewModel = [StepViewModel]()
        instructions.forEach{instruction in
            instructionsViewModel.append(StepViewModel(step: instruction))
            }
        return instructionsViewModel
    }
}


