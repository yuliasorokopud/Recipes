//
//  Search.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import SwiftUI

struct Search: View {
    @State private var input = ""
    @State private var ingredients = [String]()
    
    
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
            
            IngredientList(ingredients: $ingredients)

                
            HStack(alignment: .center, spacing: 10){
                    ClearButtonView(title: "Clear", color: Color(.systemTeal))
                        .onTapGesture {
                            ingredients.removeAll()
                            input = ""
                        }
                
                    ClearButtonView(title: "Search", color: Color(.systemGreen))
                        .onTapGesture {
                            
                        }
                        
            }
        
        }
        .padding()
        .navigationTitle("Recipe Search")
        
    }

    
    func addIngredient() {
        let answer = input.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !answer.isEmpty && !ingredients.contains(answer.lowercased()) else {
            //TODO: add alert?
            return
        }
        
        ingredients.insert(answer, at: 0)
        input = ""
        
    }
}



struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
