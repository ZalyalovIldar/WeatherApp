//
//  MapPresenter.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapPresenter: MapViewOutput, MapInteractorOutput, LocationDelegate, AutoCompleteDelegate, ImageManagerDelegate {
    
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
        interactor.getCoatOfArms(of: name)
    }
    
    // MARK: - MapInteractorOutput
    
    func getCoatOfArmsResult(with response: Response<MapInfo>) {
        switch response {
        case .success(let mapInfo):
            guard let contentURL = mapInfo.value.first?.contentUrl else { return }
            interactor.getCoatOfArmsImage(from: contentURL)
        case .error(let errorMessage):
            router.showErrorAlert(with: errorMessage)
        }
    }
    
    // MARK: - ImageManagerDelegate
    
    func getCoatOfArms(image: PhotoModel) {
        view.setCoatOfArmy(image: image.photo)
    }
    
}
