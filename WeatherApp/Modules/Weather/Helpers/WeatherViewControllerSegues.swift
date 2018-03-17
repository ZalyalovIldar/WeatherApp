//
//  ViewControllerSegue.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 14.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

extension WeatherViewController {
    
    /// Enum with segues of WeatherViewController
    ///
    /// - collectionViewSegue: segue to inner colletion view
    enum viewControllerSegue: String {
        case collectionViewSegue
    }
    
}

extension WeatherViewController: SegueHandler {}
