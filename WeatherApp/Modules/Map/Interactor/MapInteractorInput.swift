//
//  MapInteractorInput.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MapInteractorInput {
    
    func getUsersCoordinates(with delegate: LocationDelegate)
    
}
