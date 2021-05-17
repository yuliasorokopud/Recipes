//
//  ErrorCantReachDataView.swift
//  Recipes
//
//  Created by Yulia on 17.05.2021.
//

import SwiftUI

struct ErrorCantReachDataView: View {
    var body: some View {
        VStack(alignment: .center){
            Text("Oops")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Text("The data couldn’t be read because it is missing.")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Image("pizza")
                .resizable()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .scaledToFit()
        }.padding(.leading)
        
    }
}

struct ErrorCantReachDataView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorCantReachDataView()
    }
}
