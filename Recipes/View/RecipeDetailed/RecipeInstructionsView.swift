//
//  RecipeInstructionsView.swift
//  Recipes
//
//  Created by Yulia on 17.05.2021.
//

import SwiftUI

struct RecipeInstructionsView: View {
    @Binding var instructions: String
    
    var body: some View {
        if !instructions.isEmpty {
            VStack(alignment: .leading){
                Text("Instructions:")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text(instructions)
                    .font(.title3)
                    .padding(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
        }
    }
}
