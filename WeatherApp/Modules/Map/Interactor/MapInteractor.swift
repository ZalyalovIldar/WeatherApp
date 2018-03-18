//
//  MapInteractor.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapInteractor: MapInteractorInput  {
    
    private var currentCity: String?
    
    weak var presenter: MapInteractorOutput!
    var locationManager: LocationManagerProtocol!
    var mapService: MapService!
    var imageManager: ImageManagerProtocol!
    
    // MARK: - MapInteractorInput
    
    func getUsersCoordinates() {
        locationManager.getCurrentLocation()
    }
    
    func setCity(_ city: String) {
        currentCity = city
    }
    
    func getCoatOfArmsOfCity() {
        guard let city = currentCity else { return }
        let request = GetCoatOfArmsRequest(city: city)
        
        mapService.getCoatOfArms(with: request) { [weak self] (response) in
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async {
                strongSelf.presenter.getCoatOfArmsResult(with: response)
            }
            
        }
    }
    
    func getCoatOfArms(url: URL) {
        imageManager.getImageFromUrl(imageURL: url)
    }
}
