//
//  NetworkManager.swift
//  WeatherNooro
//
//  Created by Miha on 14/12/2024.
//

import Foundation

enum ApiEndopoint {
    case forecast
    
    var urlString: String {
        switch self {
        case .forecast:
            return "forecast.json"
        }
    }
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    private let baseURL: String = "https://api.weatherapi.com/v1/"
        
    private let appKey: String = "df0104101f1e4ac0b2e175311241312"
    
    /**
     Get data from server
     - Parameter searchText: Text to search recipes by
     - Returns: Recipes list
     */
    func fetchWeather(for cityName: String) async throws -> WeatherResponse {
        guard var components = URLComponents(string: baseURL + ApiEndopoint.forecast.urlString) else {
            throw NetworkError.invalidUrl
        }
        
        components.queryItems = [
            URLQueryItem(name: "key", value: appKey),
            URLQueryItem(name: "q", value: cityName),
            URLQueryItem(name: "days", value: "1"),
            URLQueryItem(name: "aqi", value: "no"),
            URLQueryItem(name: "alerts", value: "no")
        ]
        
        guard let url = components.url else {
            print("Error with url fetching data")
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        let fetchedData = try JSONDecoder().decode(WeatherResponse.self, from: try ResponseParser.parseApiResponse(response: (data,response)))
        return fetchedData
    }
}
