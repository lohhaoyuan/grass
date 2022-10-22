//
//  ContentView.swift
//  grass
//
//  Created by T Krobot on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            let col1 = UIColor(red: 0, green: 73, blue: 57, alpha: 1)

            Text("Grass !")
                .foregroundColor(col1)
                .font(.largeTitle)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
