//
//  RecipeCardView.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import SwiftUI

struct RecipeCardView: View {
    @Binding var recipe: RecipeViewModel
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            RemoteImage(url: recipe.image)
                .scaledToFill()
                .frame( maxWidth: UIScreen.main.bounds.width-30, alignment: .center)
                .clipped()
            
            RecipeInfo(title: $recipe.title, ingredients: $recipe.missedIngredients)
            
            
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.3))
                .frame(width: nil, height: 1, alignment: .center)
                .padding([.leading, .trailing], -12)
                .padding(.bottom)
            
            
            TryRecipeButton()
            
            
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
    }
}





