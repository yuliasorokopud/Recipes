//
//  ClearButtonView.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import SwiftUI

struct ClearButtonView: View {
    var title: String
    var color: Color
    
    var body: some View {
        
        HStack {
            Text(title)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(color)
        .cornerRadius(40)
        
        
        
    }
}

struct ClearButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ClearButtonView(title: "Search", color: Color(.magenta))
    }
}
