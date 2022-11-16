import SwiftUI

struct ContentView: View {
    
    @StateObject var plantManager = PlantManager()
    
    @State var isNewPlantPresented = false
    @State var plants: [Plant] = [
        Plant(name: "Grass", scientificName: "Poecae", wateringFrequency: 7, wateringGuide: "Mositen 3cm soil", fertilisationFrequency: 120, fertilisationGuide: "Nitrogen-mixed fertiliser", temperatureRangeBegin: 18, temperatureRangeEnd: 32)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach($plants) { $plant in
                    let index = plants.firstIndex(of: plant)!
                    NavigationLink(destination: PlantDetailView(plants: $plant)) {
                        VStack(alignment: .leading){
                            Text(plant.name)
                            HStack{
                                Spacer()
                            }
                        }
                    }
                }
                .onDelete { offset in
                    plants.remove(atOffsets: offset)
                }
                .onMove { source, destination in
                    plants.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle("My Plants")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isNewPlantPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }.sheet(isPresented: $isNewPlantPresented) {
            AddCustomPlantView(plants: $plantManager.plants)
        }
        
    }
}
