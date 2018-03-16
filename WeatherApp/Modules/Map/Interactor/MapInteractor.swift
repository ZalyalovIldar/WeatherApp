//
//  MapInteractor.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapInteractor: MapInteractorInput  {
    
    weak var presenter: MapInteractorOutput!
    
    var locationManager: LocationManagerProtocol!
    
    // MARK: - MapInteractorInput
    
    func getUsersCoordinates() {
        locationManager.getCurrentLocation()
    }
    
}
