//
//we were forced to write this code
//
//pls no copy
//
//made by tu madere 

import Foundation
import SwiftUI

class PlantManager: ObservableObject {
    @Published var plants: [Plant] = [] {
        didSet {
            save()
        }
    }

    let samplePlants: [Plant] = []

    
    
    init() {
        load()
    }

    func getArchiveURL() -> URL {
        let plistName = "plants.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

        return documentsDirectory.appendingPathComponent(plistName)
    }

    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedPlants = try? propertyListEncoder.encode(plants)
        try? encodedPlants?.write(to: archiveURL, options: .noFileProtection)
    }

    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()

        var finalPlants: [Plant]!

        if let retrievedPlantData = try? Data(contentsOf: archiveURL),
           let decodedPlants = try? propertyListDecoder.decode([Plant].self, from: retrievedPlantData) {
            finalPlants = decodedPlants
        } else {
            finalPlants = samplePlants
        }

        plants = finalPlants
    }
}
