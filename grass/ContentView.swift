//
//  ContentView.swift
//  grass
//
//  Created by T Krobot on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Text("Grass")
                .foregroundColor(Color(red: 0.0, green: 0.27843137, blue: 0.22745098, opacity: 100.0))
                .font(.monospaced(.largeTitle)())
                .multilineTextAlignment(.leading)

            Text("Personalise Your Growing Experience")
                .font(.body)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color(red: 0.0, green: 0.27843137, blue: 0.22745098, opacity: 100.0))
            
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
