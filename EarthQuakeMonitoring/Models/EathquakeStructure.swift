//
//  EathquakeStructure.swift
//  EarthQuakeMonitoring
//
//  Created by Gracie on 10/07/2024.
//


import Foundation
import RxSwift


struct EarthquakeData {
    let id: String
    let magnitude: Double
    let place: String
    let time: Date
    let coordinates: (latitude: Double, longitude: Double)
}
