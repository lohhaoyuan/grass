//
//  PlantSelectionView.swift
//  grass
//
//  Created by James Kuang on 28/10/22.
//

import SwiftUI

struct PlantSelectionView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("What do you want to grow?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("Swamp Green"))
                    .padding(.all, 18.0)
                Menu {
                    Button {
                        //set some variable/initialise array
                    } label: {
                        Text("Plant")
                    }
                    Button {
                        //set some variable/initialise array
                        
                    } label: {
                        Text("Plant")
                    }
                } label: {
                    Text("Select Plant")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 87.75)
                        .foregroundColor(.white)
                        .background(Color("Swamp Green"))
                        .cornerRadius(22.0)
                        .animation(.easeIn, value: 5)
                }
                
                
                
                NavigationLink(destination: AddCustomPlantView()) {
                    Text("My plant isn't here!")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 60.75)
                        .foregroundColor(.white)
                        .background(Color("Swamp Green"))
                        .cornerRadius(22.0)
                    
                }
                
            }
        }
    }
}

struct PlantSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlantSelectionView()
    }
}
