import Foundation
struct Plant: Identifiable, Codable{
    var id: UUID
    var name: String
    var scientificName: String
    var wateringFrequency: Int
    var wateringGuide: String
    var fertilisationFrequency: Int
    var fertilisationGuide: String
    var temperatureRangeBegin: Int
    var temperatureRangeEnd: Int
}
