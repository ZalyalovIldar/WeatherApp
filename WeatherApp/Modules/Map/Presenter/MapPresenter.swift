//
//  MapPresenter.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapPresenter: MapViewOutput, MapInteractorOutput {
    
    weak var view: MapViewInput!
    var router: MapRouterProtocol!
    var interactor: MapInteractorInput!

    
}
