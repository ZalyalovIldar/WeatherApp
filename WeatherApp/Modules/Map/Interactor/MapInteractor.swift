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
            strongSelf.preparePresenter(with: response)
        }
    }
    
    private func preparePresenter(with response: Response<MapInfo>) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            switch response {
            case .success(let mapInfo):
                strongSelf.presenter.getCoatOfArmsSuccess(with: mapInfo)
            case .error(let errorMessage): strongSelf.presenter.getCoatOfArmsFailure(with: errorMessage)
            }
        }
    }
    
}
