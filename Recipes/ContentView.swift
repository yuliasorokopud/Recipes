//
//  ContentView.swift
//  Recipes
//
//  Created by Yulia on 09.05.2021.
//

import SwiftUI

struct ContentView: View {
    //    init() {
    //        UINavigationBar.appearance().backgroundColor = .systemGreen
    //        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    //    }
    
    @State var isLaunching = true
    
    var body: some View {
        ZStack{
            
            NavigationView {
                Search()
            }
            .ignoresSafeArea()
            .navigationViewStyle(StackNavigationViewStyle())
            
//            LaunchView()
//                .opacity(isLaunching ? 1 : 0)
//                .onAppear {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                        withAnimation() {
//                            self.isLaunching = false
//                        }
//                    }
//                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
