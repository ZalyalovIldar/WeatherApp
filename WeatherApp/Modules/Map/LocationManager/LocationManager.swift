//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Elina on 15/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import MapKit

class LocationManager: NSObject, LocationManagerProtocol, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    var locationDelegate: LocationDelegate!
    
    init(delegate: LocationDelegate) {
        super.init()
        self.locationDelegate = delegate
        setUPLocationManager()
    }

    func setUPLocationManager() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    
    // MARK: - LocationManagerProtocol
    
    func getCurrentLocation() {
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while get location \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        let coordinates = Coordinates(longitude: longitude, latitude: latitude)
        locationDelegate.coordinatesResult(with: coordinates)
        
        self.locationManager.stopUpdatingLocation()
        
    }
    
}
