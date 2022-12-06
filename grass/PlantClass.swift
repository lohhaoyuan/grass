//
//we were forced to write this code
//
//pls no copy
//
//made by tu madere 

import Foundation
struct Plant: Identifiable, Codable, Equatable{
    var id = UUID()
    var name: String
    var scientificName: String
    var wateringFrequency: Int
    var wateringGuide: String
    var fertilisationFrequency: Int
    var fertilisationGuide: String
    var temperatureRangeBegin: Int
    var temperatureRangeEnd: Int
}
