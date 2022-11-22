//
//  AddCustomPlantView.swift
//  grass
//
//  Created by James Kuang on 29/10/22.
//

import SwiftUI

struct AddCustomPlantView: View {
    
    @State var plantName: String = ""
    @State var scienceName: String = ""
    @State var minTemp: Int = 0
    @State var maxTemp: Int = 0
    @State var waterFreq: Int = 0
    @State var fertFreq: Int = 0
    @State var waterInstruct: String = ""
    @State var fertInstruct: String = ""
    @Binding var plants: [Plant]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Form {
                Section(header: Text("Basic Details")) {
                    TextField("Plant Name", text: $plantName)
                    TextField("Scientific Name (Optional)", text: $scienceName)
                }
                Section(header: Text("Habitat")) {
                    HStack {
                        Text("Minimum Temperature")
                        TextField("", value: $minTemp, formatter: NumberFormatter())
                                .frame(width: 50)
                                .padding(.leading)
                        Text("˚C")
                        Stepper(value: $minTemp, in: -20...40) {
                                EmptyView()
                        }
                    }
                    HStack {
                        Text("Maximum Temperature")
                        TextField("", value: $maxTemp, formatter: NumberFormatter())
                                .frame(width: 50)
                                .padding(.leading)
                        Text("˚C")
                        Stepper(value: $maxTemp, in: -19...41) {
                                EmptyView()
                        }
                    }
                }
                Section(header: Text("Watering")) {
                    HStack {
                        Text("Watering Frequency")
                        TextField("", value: $waterFreq, formatter: NumberFormatter())
                                .frame(width: 50)
                                .padding(.leading)
                        Text("days")
                        Stepper(value: $waterFreq, in: 1...30) {
                                EmptyView()
                        }
                    }
                    TextField("Watering Instructions", text: $waterInstruct)
                    
                }
                Section(header: Text("Fertilisation")) {
                    HStack {
                        Text("Fertilisation Frequency")
                        TextField("", value: $fertFreq, formatter: NumberFormatter())
                                .frame(width: 50)
                                .padding(.leading)
                        Text("days")
                        Stepper(value: $fertFreq, in: 1...8) {
                                EmptyView()
                        }
                    }
                    TextField("Fertilisation Instructions", text: $fertInstruct)
                }
                Button("Save") {
                    
                    
                    
                    let plant = Plant(
                        name: plantName,
                        scientificName: scienceName,
                        wateringFrequency: waterFreq,
                        wateringGuide: waterInstruct,
                        fertilisationFrequency: fertFreq,
                        fertilisationGuide: fertInstruct,
                        temperatureRangeBegin: minTemp,
                        temperatureRangeEnd: maxTemp
                    )
                    plants.append(plant)
                    dismiss()
                }
            }
        }
        .navigationTitle("Add Custom Plant")
    }
}

struct AddCustomPlantView_Previews: PreviewProvider {
    static var previews: some View {
        AddCustomPlantView(plants: .constant([]))
    }
}
