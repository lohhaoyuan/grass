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
                    .fill(Color("Swamp Green"))
                    .edgesIgnoringSafeArea(.top)
                
                HStack{
                    VStack{
                        Spacer()
                        Text(plantsel.scientificName)
                            .italic()
                            .foregroundColor(Color(.white))
                            .font(.title)
                            .padding(.leading, 14.0)
                        
                        Text(plantsel.name)
                            .bold()
                            .foregroundColor(Color(.white))
                            .font(.largeTitle)
                            .padding(.leading, 5.0)
                        
                    }
                    Spacer()
                }
            }
            .frame(height:250)
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            
            HStack{
                VStack{
                    Text("Water every")
                        .padding([.top, .leading])

                    Text("\(plantsel.wateringFrequency)")
                        .font(.title)
                    Text("days")
                }
                Divider()
                    .frame(width: 4.0, height: 75.0)
                    .overlay(Color("Swamp Green"))
                VStack{
                    Text("Fertilise every")
                        .padding(.top)
                    
                    Text("\(plantsel.fertilisationFrequency)")
                        .font(.title)

                    
                    Text("days")
                }
                
                Divider()
                    .frame(width: 4.0, height: 75.0)
                    .overlay(Color("Swamp Green"))
                
                
                VStack{
                    Text("Keep between")
                        .padding([.top, .trailing])
                    
                    Text("\(plantsel.temperatureRangeBegin)- \(plantsel.temperatureRangeEnd)°C")
                        .font(.title)
                    
                    
                }
                
            }
            
            ZStack{
                Color(.white)
                VStack{
                    Text("Add this Plant?")
                        .font(.title)
                    Text("Grass will automatically remind you when its time to care for your plant")
                }
                .frame(width:300)
                .padding(.all)
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()

                
                Button("Yes") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 87.75)
                .foregroundColor(.white)
                .background(Color("Swamp Green"))
                .cornerRadius(22.0)
                .shadow(radius: 20)
            
                
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

