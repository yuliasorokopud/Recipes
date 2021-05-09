//
//  StepViewModel.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import Foundation

class StepViewModel: Identifiable, ObservableObject {
    
    var id: Int
    var step: String
    
    init (step: Step) {
        self.id = step.id
        self.step = step.step
    }
    
}
