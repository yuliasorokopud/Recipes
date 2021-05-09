//
//  LaunchView.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack{
            Color.yellow.ignoresSafeArea(.all)
            VStack{
                Image("launch")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .foregroundColor(.white)
                Text("Recipes")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.top)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
