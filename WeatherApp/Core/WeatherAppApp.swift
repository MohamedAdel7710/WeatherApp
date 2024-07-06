//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 23/06/2024.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    @StateObject var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            WelcomeScreen()
                .environmentObject(locationManager)
        }
    }
}
