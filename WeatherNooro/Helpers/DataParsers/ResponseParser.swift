//
//  ResponseParser.swift
//  WeatherNooro
//
//  Created by Miha on 14/12/2024.
//

import Foundation

class ResponseParser {
    static func parseApiResponse(response: (data: Data, response: URLResponse)) throws -> Data {
        guard let httpResponse = response.response as? HTTPURLResponse else {
                return response.data
            }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return response.data
        default:
            throw NetworkError.badResponse
        }
    }
}
