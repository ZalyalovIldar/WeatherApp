//
//  MapConfigurator.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapConfigurator {
    
    static func setupModule(with viewController: MapView) {
        let presenter = MapPresenter()
        let interactor = MapInteractor()
        let router = MapRouter()
        
//        viewController.presenter = presenter
//
//        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
//        return presenter
    }
    
}
