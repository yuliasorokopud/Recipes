//
//  Instructions.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import Foundation

struct Instructions: Decodable {
    var steps: [Step]
    
}


struct Step: Identifiable, Decodable {
    var id: Int
    var step: String
    
    enum CodingKeys: String, CodingKey{
        case id = "number"
        case step
    
    }
}
