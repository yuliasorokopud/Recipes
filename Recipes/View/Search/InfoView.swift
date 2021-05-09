//
//  InfoView.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image("recipe").resizable().frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("Enter the name or take a photo of an ingredient and find the most tasty recipes to cook")
        }    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
