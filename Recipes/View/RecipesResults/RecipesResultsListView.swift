//
//  RecipesResultsListView.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import SwiftUI

struct RecipesResultsListView: View {
    @ObservedObject private var viewModel: RecipeListViewModel
    init(ingredients: [String]){
        self.viewModel = RecipeListViewModel(ingredients: ingredients)
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        
    }
    
    var body: some View {
        if !viewModel.recipeList.isEmpty {
            GeometryReader { geometry in
                
                VStack(alignment: .center, spacing: 0) {
                    
                    List(viewModel.recipeList) { recipe in
                        let index = viewModel.recipeList.firstIndex(where: { $0.id == recipe.id })!
                        RecipeCardView(recipe: $viewModel.recipeList[index])
                        
                        NavigationLink(destination: RecipeDetailsView(details: DetailsViewModel(recipe: recipe))){
                        }.buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0)
                        
                    }
                    
                }
                
            }
            .foregroundColor(.black)
            .ignoresSafeArea(.all, edges: .bottom)
            } else {
                NoRecipesView()
            }
    }
}

