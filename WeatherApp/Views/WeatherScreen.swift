//
//  WeatherScreen.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 12/07/2024.
//

import SwiftUI

struct WeatherScreen: View {
    
    var weather: WeatherResponse
    var body: some View {
            VStack(alignment: .center,spacing: 5) {
                
                Text("\(weather.cityName), \(Text("\(weather.systemResponse.country)").font(.title))")
                    .font(.largeTitle)
                    .minimumScaleFactor(0.5)
                    
                
                Text("\(weather.main.temp.roundDouble())°")
                    .font(.system(size: 90, weight: .light))
                    .minimumScaleFactor(0.8)
                    .padding(.top, -10)
                    .padding(.bottom, -10)
                
                Text("\(weather.weather[0].description.capitalized)")
                    .font(.system(size: 18, weight: .medium))
                
                Text("L:\(weather.main.minTemp.roundDouble())°  H:\(weather.main.maxTemp.roundDouble())°")
                    .font(.system(size: 18, weight: .medium))
                
                VStack {
                    HStack {
                        WeatherCard(title: "Feel Like") {
                            Text("\(weather.main.feelsLike.roundDouble())°")
                                .font(.largeTitle)
                        }
                        
                        WeatherCard(title: "Max Temp") {
                            Text("\(weather.main.maxTemp.roundDouble())°")
                                .font(.largeTitle)
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        WeatherCard(title: "Sunrise / Sunset") {
                            let sunrise = TimeDateFormatter.getTime(from: weather.systemResponse.sunrise)
                            let sunSet = TimeDateFormatter.getTime(from: weather.systemResponse.sunset)
                            Text("Sunrise: \(sunrise)")
                                .font(.callout)
                            
                            Text("Sunset: \(sunSet)")
                                .font(.callout)
                        }
                        
                        WeatherCard(title: "Min Temp") {
                            Text("\(weather.main.minTemp.roundDouble())°")
                                .font(.largeTitle)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)
                    
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [.accentColor, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
            .foregroundStyle(.white)
    }
}

#Preview {
    WeatherScreen(weather: WeatherResponse.previewData)
}
