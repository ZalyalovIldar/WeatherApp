//
//  WheaterConfigurator.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherConfigurator {
    
    static func setupModule(with viewController: inout WheatherViewController) -> WeatherModuleInput {
        let presenter = WheatherPresenter()
        let interactor = WheatherInteractor()
        let wheatherApiManager = WheatherAPIManager()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.wheaterApiManager = wheatherApiManager
        
        return presenter
    }
    
}
