//
//  WeatherResponse.swift
//  WeatherNooro
//
//  Created by Miha on 14/12/2024.
//

import Foundation

struct WeatherResponse: Codable {
    let location: LocationModel
    let current: CurrentWeatherModel
}
