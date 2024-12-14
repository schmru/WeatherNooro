//
//  CurrentWeatherModel.swift
//  WeatherNooro
//
//  Created by Miha on 14/12/2024.
//

import Foundation

struct CurrentWeatherModel: Codable {
    let temperature: Float
    let condition: WeatherConditionModel
    let humidity: Int
    let uv: Int
    let feelsLikeTemperature: Float
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp_c"
        case condition = "condition"
        case humidity = "humidity"
        case uv = "uv"
        case feelsLikeTemperature = "feelslike_c"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temperature = try values.decode(Float.self, forKey: .temperature)
        condition = try values.decode(WeatherConditionModel.self, forKey: .condition)
        humidity = try values.decode(Int.self, forKey: .humidity)
        uv = try values.decode(Int.self, forKey: .uv)
        feelsLikeTemperature = try values.decode(Float.self, forKey: .feelsLikeTemperature)
    }
    
    init(temperature: Float,
         condition: WeatherConditionModel,
         humidity: Int,
         uv: Int,
         feelsLikeTemperature: Float) {
        self.temperature = temperature
        self.condition = condition
        self.humidity = humidity
        self.uv = uv
        self.feelsLikeTemperature = feelsLikeTemperature
    }
}
