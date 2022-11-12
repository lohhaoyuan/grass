//
//  ContentView.swift
//  grass
//
//  Created by saumil on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack(){
                    Text("Grass")
                        .foregroundColor(Color("Swamp Green"))
                        .font(.monospaced(.largeTitle)())
                        .multilineTextAlignment(.leading)
                    Divider()
                        .frame(width: 4.0, height: 75.0)
                        .overlay(Color("Swamp Green"))
                    Text("Personalise Your Growing Experience")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("Swamp Green"))
                }
                .padding(70.0)
                NavigationLink(destination: PlantSelectionView()) {
                    Text("Get Started")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 87.75)
                        .foregroundColor(.white)
                        .background(Color("Swamp Green"))
                        .cornerRadius(22.0)
                        .shadow(radius: 20)
                }

            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
