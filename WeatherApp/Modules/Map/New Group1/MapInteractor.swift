//
//  MapInteractor.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class MapInteractor: NSObject, MapInteractorInput  {
    
    weak var presenter: MapInteractorOutput!
    
    var GMSmanager: GMSAutocompleteManager? = nil
    var locationManager: LocationManager? = nil
    
    func getCurrentLocation() {
        locationManager?.locationManager?.requestLocation()
    }
    
    func configure(with delegate: RegionDelegate) {
        locationManager?.regionDelegate = delegate
    }
    
}

