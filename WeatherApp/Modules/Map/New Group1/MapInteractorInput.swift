//
//  MapInteractorInput.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MapInteractorInput: class {
    
    func getCurrentLocation()
    func configure(with delegate: RegionDelegate)
    
}

