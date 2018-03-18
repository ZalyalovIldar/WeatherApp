//
//  LocationManagerImplementation.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

protocol RegionDelegate {
    func didLoadRegion(with region: MKCoordinateRegion)
}

class LocationManagerImplementation: NSObject, LocationManager {
    
    var locationManager: CLLocationManager?
    var region: MKCoordinateRegion?
    var regionDelegate: RegionDelegate?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.requestLocation()
    }
}

extension LocationManagerImplementation: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager?.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let currentRegion = MKCoordinateRegion(center: location.coordinate, span: span)
            region = currentRegion
            regionDelegate?.didLoadRegion(with: currentRegion)
            
        }
    }
}

