//
//  Search.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import SwiftUI
import CoreML

struct Search: View {
    //MARK:-
    @State private var input = ""
    @State private var ingredients = [String]()
    
    
    // properties to work with image classification
    @State private var predictedFood = ""
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var showSheet = false
    @State private var showActionSheet = false
    
    
    
    //MARK: -
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
                    self.showActionSheet = true
                    
                }){
                    Image(systemName: "camera")
                        .foregroundColor(.green)
                    
                    
                }
                .actionSheet(isPresented: $showActionSheet){
                    ActionSheet(title: Text("Select A Type"), message: Text(""),
                                buttons: [.default(Text("Upload"), action: {
                                    sourceType = .photoLibrary
                                    showActionSheet = false
                                    showSheet = true
                                }),.default(Text("Take A Picture"), action: {
                                    sourceType = .camera
                                    showActionSheet = false
                                    showSheet = true
                                }),.cancel()])
                }
                .sheet(isPresented: $showSheet) {
                    ImagePicker(result: $predictedFood, sourceType: $sourceType)
                        .onDisappear(){
                            addIngredient()
                        }
                }
            }
            .padding(.trailing)
            
            IngredientListView(ingredients: $ingredients)
            
            
            HStack(alignment: .center, spacing: 10){
                Button(action: {
                    ingredients.removeAll()
                    input = ""
                }) {
                    Text("Clear")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color(.systemTeal))
                .cornerRadius(40)
                
                
                
                NavigationLink(destination: RecipesResultsListView(ingredients: ingredients)){
                    Button(action: {}) {
                        Text("Search")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGreen))
                    .cornerRadius(40)
                    .disabled(!ingredients.isEmpty ? true : false)
                }
                
               
            }
            .foregroundColor(.white)
        }
        .padding()
        .navigationTitle("Recipe Search")
        
    }
    
    
    func addIngredient() {
        var ingredient = ""
        if predictedFood.isEmpty {
            ingredient = input.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            input = ""
        } else {
            ingredient = predictedFood.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            predictedFood = ""
        }
            
            guard !ingredient.isEmpty && !ingredients.contains(ingredient.lowercased()) else {
                return
            }
            ingredients.insert(ingredient, at: 0)
        
        self.showSheet = false
    }
    
}


