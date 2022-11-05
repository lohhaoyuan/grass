//
//  PlantConfirmationView.swift
//  grass
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI

struct PlantConfirmationView: View {
    @State var plantsel = Plant(name: "Grass", scientificName: "Poaceae", wateringFrequency: 7, wateringGuide: "Adequate to moisten 3.175 cm (depth) of soil.", fertilisationFrequency: 120, fertilisationGuide: "One pound of nitrogen/mixed fertiliser is recommended per 1k ft^2 of grass", temperatureRangeBegin: 18, temperatureRangeEnd: 32)
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .fill(.cyan)
                VStack{
                    Text(plantsel.scientificName)
                        .italic()
                        .foregroundColor(Color("Swamp Green"))
                        .font(.title)
                        
                    Text(plantsel.name)
                        .bold()
                        .foregroundColor(Color("Swamp Green"))
                        .font(.largeTitle)
                    
                }
            }
            
        }
    }
}

struct PlantConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        PlantConfirmationView()
    }
}
