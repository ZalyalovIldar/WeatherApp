//
//  LocationManager.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//
import Foundation
import MapKit

protocol LocationManager {
    
    var locationManager: CLLocationManager? { get set }
    var region: MKCoordinateRegion?  { get set }
    var regionDelegate: RegionDelegate? { get set }
    
}

