//
//  ContentView.swift
//  WeatherNooro
//
//  Created by Miha on 14/12/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("", text: $searchText, prompt:
                            Text("Search Location")
                            .foregroundColor(Color("SearchPlaceholderTextColor"))
                            .font(Font.custom("Poppins", size: 15))
                )
                    .font(Font.custom("Poppins", size: 15))
                    .foregroundColor(Color("TextColor"))
                    .onChange(of: searchText) { text in
                        viewModel.searchCity(for: text)
                    }
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("SearchPlaceholderTextColor"))
            }
            .padding()
            .background(Color("SearchBackgroundColor"))
            .cornerRadius(16.0)
            
            if searchText.isEmpty {
                if viewModel.selectedCity.isEmpty {
                    Spacer()
                    Text("No City Selected")
                        .font(Font
                                .custom("Poppins", size: 30)
                                .weight(.semibold))
                        .foregroundColor(Color("TextColor"))
                    Text("Please Search For A City")
                        .font(Font
                                .custom("Poppins", size: 15)
                                .weight(.semibold))
                        .foregroundColor(Color("TextColor"))
                } else {
                    if viewModel.isLoading {
                        Spacer()
                        ProgressView()
                    } else {
                        if let data = viewModel.weatherData {
                            Spacer()
                                .frame(height: 75)
                            CurrentWeatherView(weatherData: data)
                        }
                    }
                }
                Spacer()
            } else {
                if viewModel.isLoading {
                    Spacer()
                    ProgressView()
                } else {
                    Spacer()
                        .frame(height: 32)
                    ScrollView {
                        ForEach(viewModel.cityList, id: \.self) { city in
                            CityView(viewModel: .init(cityName: city.url))
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 24.0)
        .padding(.top, 24.0)
        .onAppear(perform: viewModel.fetchWeatherForSavedCity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
