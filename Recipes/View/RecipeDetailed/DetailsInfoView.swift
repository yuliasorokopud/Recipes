//
//  DetailsInfoView.swift
//  Recipes
//
//  Created by Yulia on 11.05.2021.
//

import SwiftUI

struct DetailsInfoView: View {
    @Binding var title: String
    @Binding var time: String
    var body: some View {
        
        Text(title)
            .font(.largeTitle)
            .fontWeight(.heavy)
        
        if !time.isEmpty {
            HStack{
                Image(systemName: "clock")
                Text("\(time) minutes")
                    .font(.title3)
                Spacer()
                
            }
            .foregroundColor(Color(.brown))
            .padding(.bottom)
        }
    }
}


