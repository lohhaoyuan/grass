//
//  AddCustomPlantView.swift
//  grass
//
//  Created by James Kuang on 29/10/22.
//
import UserNotifications
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
        ZStack{
            Color.gray
                .ignoresSafeArea()
            
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
                            Text("Frequency")
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
                            Text("Frequency")
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
                        
                        let content = UNMutableNotificationContent()
                        content.title = "Water your plant"
                        content.subtitle = "It's thirsty"
                        content.sound = UNNotificationSound.default
                        
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(waterFreq*86400) , repeats: true)
                        
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(request)
                        
                        func ferreq(){}
                        func fert(){}
                        func ferttrigger(){}
                        let fert = UNMutableNotificationContent()

                        fert.title = "Fertilise your plant"
                        fert.subtitle = "It's  hungry"
                        fert.sound = UNNotificationSound.default
                        
                        // show this notification five seconds from now
                        let ferttrigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(fertFreq*86400) , repeats: true)
                        
                        // choose a random identifier
                        let ferreq = UNNotificationRequest(identifier: UUID().uuidString, content: fert, trigger: ferttrigger)
                        
                        // add our notification request
                        UNUserNotificationCenter.current().add(ferreq)
                        
                        
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
    }}

struct AddCustomPlantView_Previews: PreviewProvider {
    static var previews: some View {
        AddCustomPlantView(plants: .constant([]))
    }
}
