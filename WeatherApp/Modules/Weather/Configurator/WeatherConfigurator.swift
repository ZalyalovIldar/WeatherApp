//
//  WeatherConfigurator.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherConfigurator {
    
    static func setupModule(with viewController: WeatherViewController) -> WeatherModuleInput {
        let presenter = WeatherPresenter()
        let interactor = WeatherInteractor()
        let router = WeatherRouter()
        let alertsFactory = CommonAlertsFactory()
        let weatherService = WeatherServiceImplementation()
        let apiProvier = WeatherApiProvider()
        
        weatherService.apiProvider = apiProvier
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.weatherService = weatherService
        
        router.alertsFactory = alertsFactory
        router.view = viewController
        
        //only test!
        presenter.setCity("Moscow")
        
        return presenter
    }
    
}
