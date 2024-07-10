//
//  EarthquakeJSONStructure.swift
//  EarthQuakeMonitoring
//
//  Created by Gracie on 10/07/2024.
//


import Foundation
import Foundation

struct EarthquakeResponse: Decodable {
    let features: [EarthquakeFeature]
}

struct EarthquakeFeature: Decodable {
    let id: String
    let properties: EarthquakeProperties
    let geometry: EarthquakeGeometry
}

struct EarthquakeProperties: Decodable {
    let mag: Double
    let place: String
    let time: TimeInterval
}

struct EarthquakeGeometry: Decodable {
    let coordinates: [Double]
}
