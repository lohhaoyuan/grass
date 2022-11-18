//
//  ContentView.swift
//  grass
//
//  Created by saumil on 22/10/22.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                Image("text")
                    .resizable()
                    .scaledToFit()
                    
                    
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


struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
