//
//  ContentViewModel.swift
//  WeatherNooro
//
//  Created by Miha on 14/12/2024.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var selectedCity = ""
    @Published var weatherData: WeatherResponse?
    @Published var isLoading = false
    
    func fetchWeatherForSavedCity() {
        isLoading = true
        selectedCity = "Ljubljana"
        Task { @MainActor in
            do {
                weatherData = try await NetworkManager.shared.fetchWeather(for: selectedCity)
                isLoading = false
            } catch {
                isLoading = false
            }
        }
    }
}
