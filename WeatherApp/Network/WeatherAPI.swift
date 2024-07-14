//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 07/07/2024.
//

import Foundation
import Moya

enum WeatherEndpoint {
    case getCurrentLocationWeather(lat: String, lon: String)
}
extension WeatherEndpoint: TargetType {
    var baseURL: URL {
        guard let url = URL(string: AppConstants.NetworkConstants.baseURL) else {
            fatalError()
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getCurrentLocationWeather:
            "weather"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCurrentLocationWeather:
                .get
        }
    }
    
    var task: Moya.Task {
        var params: [String: Any] = [:]
        params["appid"] = AppConstants.NetworkConstants.apiKey
        switch self {
        case .getCurrentLocationWeather(let lat, let lon):
            params["lat"] = lat
            params["lon"] = lon
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getCurrentLocationWeather:
            StubsReader.readData(from: AppConstants.ResponseStubNames.weather.rawValue)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
    
    
}
