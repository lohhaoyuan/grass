//
//  PlantConfirmationView.swift
//  grass
//
//  Created by T Krobot on 5/11/22.
//

import SwiftUI

struct PlantConfirmationView: View {
    
    @Binding var plants: Plant
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack{
                Rectangle()
                    .fill(Color("Swamp Green"))
                    .edgesIgnoringSafeArea(.top)
                HStack{
                    VStack{
                        Spacer()
                        Text(plants.scientificName)
                            .italic()
                            .foregroundColor(Color(.white))
                            .font(.title)
                            .padding(.leading, 5.0)
                        
                        Text(plants.name)
                            .bold()
                            .foregroundColor(Color(.white))
                            .font(.largeTitle)
                            .padding(.leading, 5.0)
                    }
                    Spacer()
                }
            }
            .frame(height:150)
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            
            HStack{
                VStack{
                    Image(systemName: "drop.fill")
                        .scaledToFill()
                        .foregroundColor(.blue)
                    Text("Water every")
                    Text("\(plants.wateringFrequency)")
                        .font(.title)
                    Text("days")
                }
                Divider()
                    .frame(width: 4.0, height: 100)
                    .overlay(Color("Swamp Green"))
                VStack{
                    
                    Image(systemName: "bolt.fill")
                        .scaledToFill()
                        .foregroundColor(.orange)
                    
                    Text("Fertilise every")
                    
                    Text("\(plants.fertilisationFrequency)")
                        .font(.title)

                    
                    Text("days")
                }
                
                Divider()
                    .frame(width: 4.0, height: 100)
                    .overlay(Color("Swamp Green"))
                
                
                VStack{
                    Image(systemName: "thermometer.sun.fill")
                        .scaledToFill()
                        .foregroundColor(.orange)
                    
                    Text("Keep between")
                    
                    Text("\(plants.temperatureRangeBegin)- \(plants.temperatureRangeEnd)°C")
                        .font(.title)
                    
                    
                }
                
            }
            
            VStack{
                Color(.white)
                VStack{
                    Text("Add this Plant?")
                        .font(.title)
                    Text("Grass will automatically remind you when its time to care for your plant")
                }
                .frame(width:300)
                .padding(.all)
                
                Spacer()


                
                Button("Yes") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 137.0)
                .foregroundColor(.white)
                .background(Color("Swamp Green"))
                .cornerRadius(22.0)
                .shadow(radius: 20)
                
                Button("Change Plant Type") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 79.75)
                .foregroundColor(.white)
                .background(Color("Swamp Green"))
                .cornerRadius(22.0)
                .shadow(radius: 20)
            
                Spacer()
                
            }
            .background()
            .ignoresSafeArea()
        }
    }
}

struct PlantConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        PlantConfirmationView(plants: .constant(Plant(name: "Lorem Ipsum",scientificName: "Lorem Ipsum", wateringFrequency: 0, wateringGuide: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",fertilisationFrequency: 0,fertilisationGuide: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",temperatureRangeBegin: 0,temperatureRangeEnd: 0)))
    }
}

