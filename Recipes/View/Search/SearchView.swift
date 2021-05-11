//
//  Search.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import SwiftUI

struct Search: View {
    @State private var input = ""
//    @State private var ingredients = [String]()
    @State private var ingredients = ["tomato"]
    
    
    init(){
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        
        VStack{
            InfoView()
            HStack{
                TextField("Enter Ingredient", text: $input, onCommit: addIngredient)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                
                Button(action: {
                    //TODO: image picker
                    
                    
                }){
                    Image(systemName: "camera")
                        .foregroundColor(.green)
                    
                }
            }
            .padding(.trailing)
            
            IngredientListView(ingredients: $ingredients)
            
            
            HStack(alignment: .center, spacing: 10){
                ButtonView(title: "Clear", color: Color(.systemTeal))
                    .onTapGesture {
                        ingredients.removeAll()
                        input = ""
                    }
                
                
                
                NavigationLink(destination: RecipesResultsListView(ingredients: ingredients)){
                    ButtonView(title: "Search", color: Color(.systemGreen))
                    
                }
            }
        }
        .padding()
        .navigationTitle("Recipe Search")
        
    }
    
    
    func addIngredient() {
        let ingredient = input.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !ingredient.isEmpty && !ingredients.contains(ingredient.lowercased()) else {
            //TODO: add alert?
            return
        }
        
        ingredients.insert(ingredient, at: 0)
        input = ""
        
    }
}



struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
