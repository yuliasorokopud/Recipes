//
//  IngredientList.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import SwiftUI

struct IngredientList: View {
    @Binding var ingredients: [String]
    var body: some View {
        if !ingredients.isEmpty{
            VStack{
                Text("Ingredients list")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                    .padding(.top)
                List{
                    ForEach(ingredients, id: \.self) { user in
                        Text(user)
                    }
                    .onDelete(perform: delete)
                }
                .padding()
                .listStyle(InsetListStyle())
            }
        }
        else {
            VStack{
                Spacer()
                Image("cooking")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("""
                    No ingredients yet:(
                    Add some ingredients to find the recipe
                    """)
                    .font(.title2)
                    .padding(.top)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .padding()
        }
    }
    
    func delete(at offsets: IndexSet) {
        ingredients.remove(atOffsets: offsets)
        print(ingredients)
    }
}

struct IngredientList_Previews: PreviewProvider {
    static var previews: some View {
        IngredientList(ingredients: .constant(["avocado", "potato", "tomato"]))
    }
}
