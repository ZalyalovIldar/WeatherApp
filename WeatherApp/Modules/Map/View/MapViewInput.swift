//
//  MapViewInput.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import MapKit
import GooglePlaces

protocol MapViewInput: class {
    
    func showCurrentLocationOnMap(with region: MKCoordinateRegion)
    func showCurrentCityOnMap(with place: GMSPlace)
    
}

