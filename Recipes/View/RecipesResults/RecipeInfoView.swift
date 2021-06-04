//
//  RecipeInfoView.swift
//  Recipes
//
//  Created by Yulia on 10.05.2021.
//

import SwiftUI

struct RecipeInfo: View {
    @Binding var title: String
    @Binding var ingredients: [Ingredient]
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.system(size: 25))
                .fontWeight(Font.Weight.heavy)
            
            if (!ingredients.isEmpty){
                HStack(alignment: .top){
                    Text("With additional:")
                        .font(.system(size: 20))
                        .foregroundColor(Color.gray)
                    VStack(alignment: .leading){
                        ForEach (ingredients, id: \.self){ ingredient in
                            Text("\(ingredient.name)")
                                .font(.system(size: 18))
                                .foregroundColor(Color.gray)
                        }
                    }
                }
            }
        }
        .padding(.bottom)
    }
}
