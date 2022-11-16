import SwiftUI

struct ContentView: View {
        
    @State var isNewPlantPresented = false

    @StateObject var plantManager = PlantManager()
    
    var body: some View {
        NavigationView {
            List {
                ForEach($plantManager.plants) { $plant in
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
                    plantManager.plants.remove(atOffsets: offset)
                }
                .onMove { source, destination in
                    plantManager.plants.move(fromOffsets: source, toOffset: destination)
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
        } .sheet(isPresented: $isNewPlantPresented) {
            AddCustomPlantView(plants: $plantManager.plants)
        }
        
    }
}
