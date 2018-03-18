//
//  PinView.swift
//  WeatherApp
//
//  Created by Elina on 15/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import MapKit

class PinView: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(with latitude: CLLocationDegrees, and longitude: CLLocationDegrees, with title: String? ) {
        let currentCoordinate = CLLocationCoordinate2DMake(latitude, longitude)
        self.coordinate = currentCoordinate
        self.title = title
        let view = MKAnnotationView()
        
    }
    
}
