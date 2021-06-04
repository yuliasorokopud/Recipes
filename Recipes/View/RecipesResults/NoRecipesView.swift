//
//  ErrorView.swift
//  Recipes
//
//  Created by Yulia on 11.05.2021.
//

import SwiftUI

struct NoRecipesView: View {
    var body: some View {
        VStack(alignment: .center){
            Text("Oops, no recipes")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Image("error")
                .resizable()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .scaledToFit()
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        NoRecipesView()
    }
}
