//
//  MapViewOutput.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import MapKit

protocol MapViewOutput: class {
    
    func getCoordinates()
    
    func viewIsReady()
    
    func searchPlaces()
    
    func didFinishAutoComplete()
}
