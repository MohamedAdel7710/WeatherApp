//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 23/06/2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeScreen: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack (spacing: 25) {
            
            if let location = locationManager.lastCoordinate {
                Text("your location \(location.latitude)")
            }
            else {
                
                Text("Welcome to the \n Weather App")
                    .font(.title)
                    .bold()
                
                Text("Please share your current location to get the weather in your area")
                
                if locationManager.isLoading {
                    LoadingView()
                }
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
            .multilineTextAlignment(.center)
        
            .background(LinearGradient(colors: [Color.blue, Color.white], startPoint: .topLeading, endPoint: .bottomTrailing))
            .onAppear(perform: {
                locationManager.requestCurrentLocation()
            })
        
    }
}

#Preview {
    WelcomeScreen()
}
