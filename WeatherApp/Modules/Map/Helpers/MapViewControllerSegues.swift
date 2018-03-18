//
//  MapViewControllerSegues.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 18.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

extension MapView {
    
    enum viewControllerSegue: String {
        case weatherSegue
    }
    
}

extension MapView: SegueHandler {}
