//
//  MapPresenter.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapPresenter: MapViewOutput, MapInteractorOutput, LocationDelegate, AutoCompleteDelegate {
    
    weak var view: MapViewInput!
    var router: MapRouterProtocol!
    var interactor: MapInteractorInput!
    
    // MARK: - LocationDelegate
    
    func coordinatesResult(with coordinates: Coordinates) {
        let latitude = coordinates.latitude
        let longitude = coordinates.longitude
        view.setUserLocation(latitude: latitude, longitude: longitude)
    }
    
    // MARK: - MapViewOutput
    
    func setCity(_ city: String) {
        interactor.setCity(city)
    }
    
    func getCoordinates() {
        interactor.getUsersCoordinates()
    }
    
    func viewIsReady() {
        view.setUpMap()
        view.getUserLocation()
    }
    
    func searchPlaces() {
        router.showAutoCompleteController()
    }
    
    // MARK: - AutoCompleteDelegate
    
    func didFinishAutoComplete() {
        router.closeAutoCompleteController()
    }
    
    func show(place: Place) {
        
        let latitude = place.latitude
        let longitude = place.longitude
        let placeName = place.placeName
        let placeFormattedAddress = place.placeFormattedAddress
        
        view.setCamera(latitude: latitude, longitude: longitude, placeName: placeName, placeFormattedAddress: placeFormattedAddress)
    }
    
    func showAutoCompleteError(with message: String) {
        router.showAutoCompleteErrorAlert(with: message)
    }
    
    func cityIsDefined(name: String) {
        self.setCity(name)
    }
    
    // MARK: - MapInteractorOutput
    
    func getCoatOfArmsSuccess(with mapInfo: MapInfo) {
        guard let contentURL = mapInfo.value.first?.contentUrl else { return }
        
        //set coat of arms to pin view
    }
    
    func getCoatOfArmsFailure(with message: String) {
        router.showErrorAlert(with: message)
    }

}
