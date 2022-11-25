//
//  PlantSelectionView.swift
//  grass
//
//  Created by James Kuang on 28/10/22.
//

import SwiftUI

struct PlantSelectionView: View {
    
    @StateObject var plantManager = PlantManager()
    
    var body: some View {
            VStack{
                Text("What do you want to grow?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("Swamp Green"))
                    .padding([.top, .leading, .trailing], 18.0)
                
                Text("We would give you plants but we want to give you maximum flexibility so you can add your own plant!")
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("Swamp Green"))
                    .padding([.leading, .bottom, .trailing], 29.0)
                    .padding(/*@START_MENU_TOKEN@*/.top, 3.0/*@END_MENU_TOKEN@*/)
                

                NavigationLink(destination: AddCustomPlantView(plants: $plantManager.plants)) {
                    Text("Add Plant")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 60.75)
                        .foregroundColor(.white)
                        .background(Color("Swamp Green"))
                        .cornerRadius(22.0)
                        .shadow(radius: 20)
                }
        }
    }
}

struct PlantSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PlantSelectionView()
    }
}
