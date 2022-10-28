//
//  ContentView.swift
//  grass
//
//  Created by T Krobot on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack(){
                Text("Grass")
                    .foregroundColor(Color(red: 0.0, green: 0.27843137, blue: 0.22745098, opacity: 100.0))
                    .font(.monospaced(.largeTitle)())
                    .multilineTextAlignment(.leading)
                
                Divider()
                    .frame(width: 4.0, height: 75.0)
                    .overlay(Color(.green))
                Text("Personalise Your Growing Experience")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color(red: 0.0, green: 0.27843137, blue: 0.22745098, opacity: 100.0))
   
                
            }
            .padding(70.0)
            Button("Get Started.") {

            }
            .navigationTitle("The Entrace Screen")
            .padding(.vertical, 20)
            .padding(.horizontal, 87.75)
            .foregroundColor(.white)
            .background(Color(red: -0.123, green: 0.285, blue: 0.225))
            .cornerRadius(22.0)

        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
