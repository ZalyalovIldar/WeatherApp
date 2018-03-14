//
//  ViewControllerSegue.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 14.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

extension WeatherViewController {
    
    enum viewControllerSegue: String {
        case collectionViewSegue
    }
    
}

extension WeatherViewController: SegueHandler {}
