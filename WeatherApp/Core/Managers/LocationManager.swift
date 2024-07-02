//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 28/06/2024.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
 
    private let manager = CLLocationManager()
    @Published var lastCoordinate: CLLocationCoordinate2D?
    
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestCurrentLocation() {
        manager.requestLocation()
        isLoading = true
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastCoordinate = locations.first?.coordinate
        isLoading = false
    }
    
}
