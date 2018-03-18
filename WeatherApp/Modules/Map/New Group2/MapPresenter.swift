//
//  MapPresenter.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import MapKit
import GooglePlaces

class MapPresenter: MapViewOutput, MapInteractorOutput, RegionDelegate, PlaceDelegate {
    
    
    weak var view: MapViewInput?
    var interactor: MapInteractorInput!
    var locationManager = LocationManagerImplementation()
    
    func getCurrentLocation() {
        interactor.getCurrentLocation()
        interactor.configure(with: self)
    }
    
    func configure(with manager: inout GMSAutocompleteManager) {
        manager.placeDelegate = self
    }
    
    func didLoadPlace(with place: GMSPlace) {
        view?.showCurrentCityOnMap(with: place)
    }
    
    func didLoadRegion(with region: MKCoordinateRegion) {
        view?.showCurrentLocationOnMap(with: region)
    }
    
    func didFinishGetCurrentLocation(with region: MKCoordinateRegion) {
        //view?.showCurrentLocationOnMap(with: region)
    }
}

