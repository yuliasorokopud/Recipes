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
    @State private var image: UIImage = UIImage()
    @State private var predictedFood = ""
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var showSheet = false
    @State private var showActionSheet = false
    @State private var imageSelected = false
    
    
    
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
                    ImagePicker(selectedImage: self.$image, imageSelected: self.$imageSelected, sourceType: $sourceType)
                        .onDisappear{
                            if imageSelected{
                                performImageClassification()}
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
                .foregroundColor(.white)
                .background(Color(.systemTeal))
                .cornerRadius(40)
                
                
                
                NavigationLink(destination: RecipesResultsListView(ingredients: ingredients)){
                    Button(action: {}) {
                        Text("Search")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(.systemGreen))
                    .cornerRadius(40)
                    .disabled(!ingredients.isEmpty ? true : false)
                }
                
               
            }
        }
        .padding()
        .navigationTitle("Recipe Search")
        
    }
    
    
    func addIngredient() {
        if predictedFood.isEmpty {
            let ingredient = input.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            
            guard !ingredient.isEmpty && !ingredients.contains(ingredient.lowercased()) else {
                return
            }
            
            ingredients.insert(ingredient, at: 0)
            input = ""
        } else {
            guard !predictedFood.isEmpty && !ingredients.contains(predictedFood.lowercased()) else {
                return
            }
            ingredients.insert(predictedFood, at: 0)
            predictedFood = ""
        }
    }
    
    private func performImageClassification(){
        do{
            let config = MLModelConfiguration()
            let model = try IngredientsClassifier(configuration: config)
            
            
            guard let resizedImage = image.resizeTo(size: CGSize(width: 229, height: 229)),
                  let buffer = resizedImage.toBuffer() else { return }
            
            let output = try? model.prediction(image: buffer)
            
            if let output = output {
                // show only one result with the highest confidence level
                self.predictedFood = output.classLabel
                addIngredient()
            }
        }
        catch {
            print(error.localizedDescription)
        }
        
        self.showSheet = false
    }
    
}


