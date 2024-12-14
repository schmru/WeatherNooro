//
//  CityViewModel.swift
//  WeatherNooro
//
//  Created by Miha on 14/12/2024.
//

import Foundation

class CityViewModel: ObservableObject {
    let cityName: String
    @Published var weatherData: WeatherResponse?
    @Published var isLoading = false
    
    init(cityName: String) {
        self.cityName = cityName
    }
    
    func fetchWeatherForCity() {
        isLoading = true
        Task { @MainActor in
            do {
                weatherData = try await NetworkManager.shared.fetchWeather(for: cityName)
                isLoading = false
            } catch {
                isLoading = false
            }
        }
    }
}
