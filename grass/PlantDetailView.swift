//
//  PlantDetailView.swift
//  grass
//
//  Created by hy loh on 14/11/22.
//

import SwiftUI

struct PlantDetailView: View {
    
    @Binding var plants: Plant
    
    var body: some View {
        VStack {
            List{
                if let scienceName = plants.scientificName {
                    Section(header: Text("Details")) {
                        HStack{
                            Image(systemName: "tag.fill")
                            Text("Plant Name")
                            Spacer()
                            Text(plants.name)
                                .foregroundColor(Color(.gray))
                                .multilineTextAlignment(.trailing)
                        }
                        HStack{
                            Image(systemName: "testtube.2")
                                .foregroundColor(.purple)
                            Text("Scientific Name")
                            Spacer()
                            Text(scienceName)
                                .foregroundColor(Color(.gray))
                        }
                    }
                } else {
                    Section(header: Text("Details")) {
                        HStack{
                            Image(systemName: "tag.fill")
                            Text("Plant Name")
                            Spacer()
                            Text(plants.name)
                                .foregroundColor(Color(.gray))
                                .multilineTextAlignment(.trailing)
                        }
                    }
                }
                Section(header: Text("Care Instructions")) {
                    HStack{
                        Image(systemName: "thermometer.low")
                            .foregroundColor(.blue)
                        Text("Minimum Temperature")
                        Spacer()
                        Text("\(String(plants.temperatureRangeBegin))˚C")
                            .foregroundColor(.gray)
                    }
                    HStack{
                        Image(systemName: "thermometer.high")
                            .foregroundColor(.red)
                        Text("Maximum Temperature")
                        Spacer()
                        Text("\(String(plants.temperatureRangeEnd))˚C")
                            .foregroundColor(.gray)
                    }
                    HStack{
                        Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                        Text("Water every \(plants.wateringFrequency) days")
                                .bold()
                    }
                    HStack {
                        Text(plants.wateringGuide)
                    }
                    HStack {
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.mint)
                        Text("Fertilise every \(plants.fertilisationFrequency) days")
                            .bold()
                    }
                    HStack {
                        Text(plants.fertilisationGuide)
                    }
                }
            }
        }
        .navigationTitle(plants.name)
    }
}
    
struct PlantDetailView_Previews: PreviewProvider {        static var previews: some View {
            PlantDetailView(plants: .constant(Plant(name: "Lorem Ipsum",scientificName: "Lorem Ipsum", wateringFrequency: 0, wateringGuide: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",fertilisationFrequency: 0,fertilisationGuide: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",temperatureRangeBegin: 0,temperatureRangeEnd: 0)))
        }
    }
