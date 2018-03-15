//
//  MapPresenter.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapPresenter: MapViewOutput, MapInteractorOutput, LocationDelegate {
    
    weak var view: MapViewInput!
    var router: MapRouterProtocol!
    var interactor: MapInteractorInput!
    
    // -MARK: LocationDelegate
    
    func coordinatesResult(with coordinates: Coordinates) {
        let latitude = coordinates.latitude
        let longitude = coordinates.longitude
        view.setUserLocation(latitude: latitude, longitude: longitude)
    }
    
    // -MARK: MapViewOutput
    
    func getCoordinates() {
        interactor.getUsersCoordinates(with: self)
    }

}
