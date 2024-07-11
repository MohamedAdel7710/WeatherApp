//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 07/07/2024.
//

import Foundation

struct WeatherResponse: Codable {
    struct Coordinate: Codable {
        let lon: Double
        let lat: Double
    }
    struct Weather: Codable {
        let id : Int
        let main: String
        let description: String
        let icon: String
    }
    struct MainResponse: Codable {
        let temp: Double
        let feelsLike: Double
        let minTemp: Double
        let maxTemp: Double
        let humidity: Double
        
        enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case minTemp = "temp_min"
            case maxTemp = "temp_max"
            case humidity
        }
    }
    
    let coordinate: Coordinate
    let weather: [Weather]
    let main: MainResponse
    let cityName: String
    
    enum CodingKeys: String, CodingKey {
        case coordinate = "coord"
        case weather
        case main
        case cityName = "name"
    }
}
