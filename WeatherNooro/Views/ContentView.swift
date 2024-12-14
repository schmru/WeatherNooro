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
        ScrollView {
            HStack {
                TextField("", text: $searchText, prompt:
                            Text("Search Location")
                            .foregroundColor(Color("SearchPlaceholderTextColor"))
                            .font(Font.custom("Poppins", size: 15))
                )
                    .font(Font.custom("Poppins", size: 15))
                    .foregroundColor(Color("TextColor"))
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("SearchPlaceholderTextColor"))
            }
            .padding()
            
            .background(Color("SearchBackgroundColor"))
            .cornerRadius(16.0)
            
            Spacer()
        }
        .padding(.horizontal, 24.0)
        .padding(.top, 24.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
