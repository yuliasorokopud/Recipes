//
//  IngredientsView.swift
//  Recipes
//
//  Created by Yulia on 11.05.2021.
//

import SwiftUI

struct RecipeIngredientsView: View {
    @Binding var ingredients: [IngredientViewModel]
    var body: some View {
        
        Text("Ingredients:")
            .font(.title)
            .fontWeight(.bold)
            .padding(.bottom)
        
        ForEach(ingredients){ i in
            VStack{
            HStack{
                Text("・ \(i.name)")
                    .font(.title3)
                    .padding(.leading)
                Spacer()
                Text("\(i.amount)")
                    .font(.title3)
                    .padding(.leading)
                    .foregroundColor(Color("my-pink"))
                Text("\(i.unit)")
                    .font(.title3)
                
            }
                Rectangle()
                    .foregroundColor(Color("my-pink").opacity(0.3))
                    .frame(width: nil, height: 1, alignment: .center)
                    .padding([.leading, .trailing], -12)
                    .padding(.horizontal)
            }.padding(.bottom)
        }
        Spacer()
    }
}


