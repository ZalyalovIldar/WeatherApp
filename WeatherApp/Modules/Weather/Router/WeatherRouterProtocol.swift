//
//  WeatherRouterProtocol.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherRouterProtocol: class {
    
    /// Show UIAlertController with error title
    ///
    /// - Parameter message: error message to show
    func showErrorAlert(with message: String)
    
    /// Send new data to inner collection view
    ///
    /// - Parameter data: any data
    func sendWeatherInfoToCollectionContainer(_ weatherInfo: WeatherInfo)
    
    /// Setup link to collection view
    ///
    /// - Parameter moduleInput: collection view presenter
    func setCollectionContainerModuleInput(_ moduleInput: ModuleInput)
    
}
