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
                            .padding(.leading, 14.0)
                        
                        Text(plants.name)
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
                    Text("\(plants.wateringFrequency)")
                        .font(.title)
                    Text("days")
                }
                Divider()
                    .frame(width: 4.0, height: 75.0)
                    .overlay(Color("Swamp Green"))
                VStack{
                    Text("Fertilise every")
                        .padding(.top)
                    
                    Text("\(plants.fertilisationFrequency)")
                        .font(.title)

                    
                    Text("days")
                }
                
                Divider()
                    .frame(width: 4.0, height: 75.0)
                    .overlay(Color("Swamp Green"))
                
                
                VStack{
                    Text("Keep between")
                        .padding([.top, .trailing])
                    
                    Text("\(plants.temperatureRangeBegin)- \(plants.temperatureRangeEnd)°C")
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
        PlantConfirmationView(plants: .constant(Plant(name: "Lorem Ipsum",scientificName: "Lorem Ipsum", wateringFrequency: 0, wateringGuide: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",fertilisationFrequency: 0,fertilisationGuide: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",temperatureRangeBegin: 0,temperatureRangeEnd: 0)))
    }
}

