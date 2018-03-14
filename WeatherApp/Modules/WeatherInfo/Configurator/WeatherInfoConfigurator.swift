//
//  WeatherInfoConfigurator.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 12.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherInfoConfigurator {
    
    func setupModule(with viewController: WeatherInfoViewController) {
        let preseter = WeatherInfoPresenter()
        let interactor = WeatherInfoInteractor()
        let router = WeatherInfoRouter()
    
        viewController.presenter = preseter
        viewController.moduleInput = preseter
        
        preseter.view = viewController
        preseter.interactor = interactor
        preseter.router = router
        
        interactor.presenter = preseter
        
        router.viewController = viewController
    }
    
}
