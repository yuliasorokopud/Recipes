//
//  RecipeDetails.swift
//  Recipes
//
//  Created by Yulia on 10.05.2021.
//

import SwiftUI

struct RecipeDetailsView: View {
    @ObservedObject var details: DetailsViewModel
    
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {
            StickyHeader {
                RemoteImage(url: details.recipe.image)
                    .aspectRatio(contentMode: .fill)
            }
            
            ZStack(alignment: .topLeading){
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(height:500 )
                    .foregroundColor(.white)
                
                VStack(alignment: .leading) {
                    
                    
                    if !details.ingredients.isEmpty{
                        
                        DetailsInfoView(title: $details.recipe.title, time: $details.time)
                        Divider()
                            .foregroundColor(.gray)
                            .frame(width: nil, height: 1, alignment: .center)
                            .padding([.leading, .trailing], -12)
                            .padding(.bottom)
                        
                        
                        RecipeIngredientsView(ingredients: $details.ingredients)
                        RecipeInstructionsView(instructions: $details.instructions)
                    } else {
                        ErrorCantReachDataView()
                    }
                }
                .padding()
                .padding(.top)
            }
            
            .foregroundColor(.black)
            
        }
        
        
    }
}

