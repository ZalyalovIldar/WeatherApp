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
    
    /// To get coordinates
    func getCoordinates()
    
    /// View lifecycle
    func viewIsReady()
    
    /// To search place after auto complete
    func searchPlaces()
    
    /// Result of auto complete
    func didFinishAutoComplete()
}
