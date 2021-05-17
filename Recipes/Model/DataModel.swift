//
//  DataModel.swift
//  ListOfMovies
//
//  Created by Yulia on 29.04.2021.
//

import Foundation
import Alamofire
import  Combine


class DataModel {
    
    //MARK:  Properties
    private var task: Cancellable? = nil
    private let baseUrl = "https://api.spoonacular.com/recipes/"
    private let API_KEY = "173d1e55ebd3439797b6b57f7570975e"
    
    
    //MARK: - fetching
    func loadRecipes(ingredients: [String], completion: @escaping (([Recipe]?) -> Void)){
        
        let ingredientsString = convertToString(ingredients)
        if ingredientsString == "" {
            print("Empty ingredients string")
            return
        }
        self.task = AF.request(baseUrl + "findByIngredients?",
                               parameters: ["ingredients": ingredientsString,
                                            "apiKey": API_KEY])
            .publishDecodable(type: [Recipe].self)
            .sink(receiveCompletion: {completion in
                switch completion{
                case .finished:
                    ()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { (response) in
                switch response.result {
                case .success(let model) :
                    completion(model)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
    }
    
    
    func loadRecipeInfo(id: Int, completion: @escaping((Details)-> Void)){
        
        self.task = AF.request(baseUrl + "\(id)/information?",
                               parameters: ["apiKey": API_KEY])
            .publishDecodable(type: Details.self)
            .sink(receiveCompletion: {completion in
                switch completion{
                case .finished:
                    ()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { (response) in
                switch response.result {
                case .success(let model) :
                    completion(model)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
    }
    
    
    
    
    
    //MARK: - Helpers
    func convertToString(_ ingredients: [String]) -> String{
        if ingredients.isEmpty {
            return ""
        }
        var ingredientsString = ""
        for i in ingredients {
            ingredientsString += ingredientsString=="" ? "\(i)" : ",+\(i)"
        }
        return ingredientsString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
    
}
