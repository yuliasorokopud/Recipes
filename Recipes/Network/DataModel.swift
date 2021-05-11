//
//  DataModel.swift
//  ListOfMovies
//
//  Created by Yulia on 29.04.2021.
//

import Foundation


class DataModel {
    
    //MARK:  Properties
    private var dataTask: URLSessionDataTask?
    var counter = 0
    
    
    //MARK: - fetching
    func loadRecipes(ingredients: [String], completion: @escaping(([Recipe])-> Void)){
        
        let ingredientsString = convertToString(ingredients)
        if ingredientsString == "" {
            print("Empty ingredients string")
            return
        }
        
        dataTask?.cancel()
        
        guard let url = buildSearchUrl(ingredients: ingredientsString) else {
            completion([])
            print("Invalid URL")
            return
        }
        
        
        dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion([])
                return
            }
            
            
            if let movieResponse = try? JSONDecoder().decode([Recipe].self, from: data) {
                completion(movieResponse)
            }
        }
        
        dataTask?.resume()
    }
    
    
    
    
    func loadRecipeInfo(id: Int, completion: @escaping((Details)-> Void)){
        dataTask?.cancel()
        
        guard let url = buildIdUrl(id: id) else {
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            
            if let response = try? JSONDecoder().decode(Details.self, from: data) {
                completion(response)
            } else {
            }
        }
        
        dataTask?.resume()
    }
    
    
    
    
    
    //MARK: - Helpers
    private func buildSearchUrl (ingredients: String) -> URL? {
        let queryItems = [
            URLQueryItem(name: "ingredients", value: "\(ingredients)"),
            URLQueryItem(name: "apiKey", value: "d99016218c4242bba3927c475191b2f9")
        ]
        var compnents = URLComponents(string: "https://api.spoonacular.com/recipes/findByIngredients?")
        compnents?.queryItems = queryItems
        
        return compnents?.url
    }
    
    private func buildIdUrl (id: Int) -> URL? {
        let queryItems = [
            URLQueryItem(name: "apiKey", value: "d99016218c4242bba3927c475191b2f9")
        ]
        var compnents = URLComponents(string: "https://api.spoonacular.com/recipes/\(id)/information?")
        compnents?.queryItems = queryItems
        
        return compnents?.url
    }
    
    
    func convertToString(_ ingredients: [String]) -> String{
        if ingredients.isEmpty {
            return ""
        }
        var ingredientsString = ""
        for i in ingredients {
            ingredientsString += ingredientsString=="" ? "\(i)" : ",+\(i)"
        }
        
        //takes care of spaces
        return ingredientsString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
    
}

//search
//https://api.spoonacular.com/recipes/findByIngredients?ingredients=apples,+flour,+sugar&number=2

//details
//https://api.spoonacular.com/recipes/id/information&apiKey=173d1e55ebd3439797b6b57f7570975e

//instructions
//https://api.spoonacular.com/recipes/id/analyzedInstructions


