//
//  CurrentWeatherView.swift
//  WeatherNooro
//
//  Created by Miha on 14/12/2024.
//

import SwiftUI

struct CurrentWeatherView: View {
    let weatherData: WeatherResponse
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https:\(weatherData.current.condition.icon)")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Text("Loading...")
            }
            .frame(height: 123, alignment: .center)
            
            Text(weatherData.location.name)
                .font(Font
                        .custom("Poppins", size: 30)
                        .weight(.semibold))
                .foregroundColor(Color("TextColor"))
            
            Spacer()
                .frame(height: 24)
            
            Text("\(String(format:"%.0f", weatherData.current.temperature))°")
                .font(Font
                        .custom("Poppins", size: 70)
                        .weight(.medium))
                .foregroundColor(Color("TextColor"))
            
            Spacer()
                .frame(height: 24)
            
            HStack(spacing: 56.0) {
                TitleValueView(title: "Humidity", value: "\(weatherData.current.humidity)%")
                TitleValueView(title: "UV", value: "\(weatherData.current.uv)")
                TitleValueView(title: "Feels Like", value: "\(String(format:"%.0f", weatherData.current.feelsLikeTemperature))°")
            }
            .padding(16.0)
            .background(Color("SearchBackgroundColor"))
            .cornerRadius(16.0)
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(weatherData: .init(location: .init(name: "Name"),
                                              current: .init(temperature: 0,
                                                             condition: .init(icon: ""),
                                                             humidity: 0,
                                                             uv: 0,
                                                             feelsLikeTemperature: 0)))
    }
}

