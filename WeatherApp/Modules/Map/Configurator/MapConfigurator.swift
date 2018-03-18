//
//  MapConfigurator.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapConfigurator {
    
    static func setUpModule(with viewController: MapView) {
        
        let presenter = MapPresenter()
        let interactor = MapInteractor()
        let router = MapRouter()
        let locationManager = LocationManager(delegate: presenter)
        let autoCompleteManager = AutoCompleteManager(delegate: presenter)
        let alertsFactory = CommonAlertsFactory()
        let mapService = MapServiceImplementation()
        let mapApiProvider = MapApiProvider()
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        viewController.presenter = presenter
        
        interactor.locationManager = locationManager
        interactor.mapService = mapService
        
        router.autoCompleteManager = autoCompleteManager
        router.view = viewController
        router.alertsFactory = alertsFactory
        
        mapService.apiProvider = mapApiProvider
        
    }
    
}
