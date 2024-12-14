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
    @Published var cityList: [CityModel] = [CityModel]()
    @Published var isLoading = false
    
    func fetchWeatherForSavedCity() {
        isLoading = true
        Task { @MainActor in
            do {
                weatherData = try await NetworkManager.shared.fetchWeather(for: selectedCity)
                isLoading = false
            } catch {
                isLoading = false
            }
        }
    }
    
    func searchCity(for searchText: String) {
        isLoading = true
        Task { @MainActor in
            do {
                cityList = try await NetworkManager.shared.fetchCityList(for: searchText)
                isLoading = false
            } catch {
                isLoading = false
            }
        }
    }
}
