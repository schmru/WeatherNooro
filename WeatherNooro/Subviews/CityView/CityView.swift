//
//  CityView.swift
//  WeatherNooro
//
//  Created by Miha on 14/12/2024.
//

import SwiftUI

struct CityView: View {
    @ObservedObject var viewModel: CityViewModel
    
    var body: some View {
        HStack {
            if viewModel.isLoading {
                Spacer()
                ProgressView()
            } else {
                Spacer()
                if let data = viewModel.weatherData {
                    VStack {
                        Text(data.location.name)
                            .font(Font
                                    .custom("Poppins", size: 20)
                                    .weight(.semibold))
                            .foregroundColor(Color("TextColor"))
                        
                        Text("\(String(format:"%.0f", data.current.temperature))°")
                            .font(Font
                                    .custom("Poppins", size: 60)
                                    .weight(.medium))
                            .foregroundColor(Color("TextColor"))
                    }
                    Spacer()
                    AsyncImage(url: URL(string: "https:\(data.current.condition.icon)")) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Text("Loading...")
                    }
                    .frame(height: 85, alignment: .center)
                } else {
                    Text("Missing city data")
                        .font(Font
                                .custom("Poppins", size: 20)
                                .weight(.semibold))
                        .foregroundColor(Color("TextColor"))
                }
                Spacer()
            }
        }
        .padding(16.0)
        .background(Color("SearchBackgroundColor"))
        .cornerRadius(16.0)
        .onAppear(perform: viewModel.fetchWeatherForCity)
    }
}


struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        TitleValueView(title: "Title", value: "Value")
    }
}
