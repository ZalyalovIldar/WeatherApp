//
//  MapRouterProtocol.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MapRouterProtocol {
    
    /// To show AutoCompleteController
    func showAutoCompleteController()
    
    /// To close AutoCompleteController
    func closeAutoCompleteController()
    
    /// To show alert with auto complete error
    ///
    /// - Parameter message: message in alert
    func showAutoCompleteErrorAlert(with message: String)
    
    /// To show alert with error
    ///
    /// - Parameter with: message in alert
    func showErrorAlert(with: String)
    
    /// Show weather info screen
    ///
    /// - Parameter place: place info
    func showWeatherScreen(with place: Place)
    
}
