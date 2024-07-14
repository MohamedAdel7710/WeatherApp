//
//  AppConstants.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 07/07/2024.
//

import Foundation

struct AppConstants {
    
    struct NetworkConstants {
        public static let baseURL = "https://api.openweathermap.org/data/2.5"
        public static let apiKey = "4c88ea8b368c4f804597d275828c7cb6"
    }
    
    enum ResponseStubNames: String {
        case weather = "WeatherRespnoseStub"
    }
}
