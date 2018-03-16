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
        let locationManager = LocationManager(with: presenter)
        let autoCompleteManager = AutoCompleteManager()
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        viewController.presenter = presenter
        interactor.locationManager = locationManager
        router.autoCompleteController = autoCompleteManager
        router.view = viewController
        
    }
    
}
