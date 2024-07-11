//
//  WeatherDataProvider.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 07/07/2024.
//

import Foundation
import Moya

protocol WeatherDataProtocol {
    func getCurrentWeather(lat: String, lon: String)
}

final class WeatherDataProvider {
    
    let moyaProvider: MoyaProvider<MultiTarget>
    
    init(moyaProvider: MoyaProvider<MultiTarget> =  MoyaProvider<MultiTarget>()) {
        self.moyaProvider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
        
    }
    
    func getCurrentWeather(lat: String, lon: String) {
        moyaProvider.request(MultiTarget(WeatherAPI.getCurrentLocationWeather(lat: lat, lon: lon))) { result in
            switch result {
            case .success(let response):
                do {
                    let result = try JSONDecoder().decode(WeatherResponse.self, from: response.data)
                    print(result)
                } catch {
                    print(error) // TODO: Error Handling
                }
            case .failure(let error):
                print(error)    // TODO: Error Handling
            }
        }
    }
}
