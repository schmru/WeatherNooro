//
//  TitleValueView.swift
//  WeatherNooro
//
//  Created by Miha on 14/12/2024.
//

import SwiftUI

struct TitleValueView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(Font
                        .custom("Poppins", size: 8)
                        .weight(.medium))
                .foregroundColor(Color("SearchPlaceholderTextColor"))
            
            Text(value)
                .font(Font
                        .custom("Poppins", size: 15)
                        .weight(.medium))
                .foregroundColor(Color("ValueTextColor"))
        }
    }
}

struct TitleValueView_Previews: PreviewProvider {
    static var previews: some View {
        TitleValueView(title: "Title", value: "Value")
    }
}
