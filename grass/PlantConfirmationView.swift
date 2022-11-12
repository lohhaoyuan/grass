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
        VStack(spacing: 0) {
            ZStack{
                Rectangle()
                    .fill(.cyan)
                    .edgesIgnoringSafeArea(.top)
                HStack{
                    VStack{
                        Spacer()
                        Text(plantsel.scientificName)
                            .italic()
                            .foregroundColor(Color("Swamp Green"))
                            .font(.title)
                        
                        Text(plantsel.name)
                            .bold()
                            .foregroundColor(Color("Swamp Green"))
                            .font(.largeTitle)
                        
                    }
                    Spacer()
                }
            }
            .frame(height:250)
            
            List{
                Text("Water every \(plantsel.wateringFrequency) days")
                Text("Fertilise every \(plantsel.fertilisationFrequency) days")
                Text("Keep between \(plantsel.temperatureRangeBegin)°C and \(plantsel.temperatureRangeEnd)°C")
            }

            ZStack{
                Color(.white)
                Rectangle()
                    .foregroundColor(Color(.systemGray6))
                VStack{
                    Text("Add this Plant?")
                        .font(.title)
                    Text("Grass will automatically remind you when its time to care for your plant")
                }
                .frame(width:300)
                .padding(.all)
            }
            .background()
            .ignoresSafeArea()
        }
    }
}

struct PlantConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        PlantConfirmationView()
    }
}
