//
//  MapConfigurator.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapConfigurator {
    
    static func setupModule() -> MapViewController? {
        
        let viewController = MapViewController.instantiate(fromAppStoryboard: .main)
        
        let presenter = MapPresenter()
        let interactor = MapInteractor()
        let locationManager = LocationManagerImplementation()
        let GMSManager = GMSAutocompleteManagerImplementation()
        let mapManager = MapManagerImplemetnation()
        let queryManager = GoogleQueryApiManagerImplementation()
        
        mapManager.queryManager = queryManager
        
        viewController.presenter = presenter
        viewController.mapManager = mapManager
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.locationManager = locationManager
        interactor.GMSmanager = GMSManager
        
        return viewController
    }
    
    
}

