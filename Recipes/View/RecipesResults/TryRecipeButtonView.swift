//
//  TryRecipeButtonView.swift
//  Recipes
//
//  Created by Yulia on 10.05.2021.
//

import SwiftUI

struct TryRecipeButton: View {
    var body: some View {
        HStack{
            Spacer()
            Text("TRY RECIPE")
                .fontWeight(Font.Weight.heavy)
                .font(.subheadline)
                .foregroundColor(Color(red: 231/255, green: 119/255, blue: 112/255))
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}
