//
//  MapInteractorOutput.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import MapKit

protocol MapInteractorOutput: class {
    
    func didFinishGetCurrentLocation(with region: MKCoordinateRegion)
    
}

