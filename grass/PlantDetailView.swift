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
                Section(header: Text("Details")) {
                    HStack{
                        Image(systemName: "photo.on.rectangle")
                        Text("Plant Name")
                        Spacer()
                        Text(plants.name)
                            .foregroundColor(Color(.gray))
                            .multilineTextAlignment(.trailing)
                    }
                    HStack{
                        Image(systemName: "photo.on.rectangle")
                        Text("Scientific Name")
                        Spacer()
                        Text(plants.scientificName)
                            .foregroundColor(Color(.gray))
                    }
                }
                Section(header: Text("Care Instructions")) {
                    HStack{
                        Image(systemName: "photo.on.rectangle")
                        Text("Water every \(plants.wateringFrequency) days")
                    }
                    
                }
            }
        }
        .navigationTitle(plants.name)
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plants: .constant(Plant(name: "placeholder",scientificName: "latin placeholder", wateringFrequency: 3, wateringGuide: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",fertilisationFrequency: 3,fertilisationGuide: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",temperatureRangeBegin: 0,temperatureRangeEnd: 1000)))
    }
}
