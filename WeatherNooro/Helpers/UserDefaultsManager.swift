//
//  UserDefaultsManager.swift
//  WeatherNooro
//
//  Created by Miha on 14/12/2024.
//

import Foundation

class UserDefaultsManager {
    static private let key = "city"
    static private let defaults = UserDefaults.standard
    
    static func save(cityUrl: String) {
        defaults.set(cityUrl, forKey: key)
    }
    
    static func getCity() -> String {
        let city = defaults.object(forKey: key) as? String ?? ""
        return city
    }
}
