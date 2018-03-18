//
//  MapRouterProtocol.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MapRouterProtocol {
    
    func showAutoCompleteController()
    
    func closeAutoCompleteController()
    
    func showAutoCompleteErrorAlert(with message: String)
    
    func showErrorAlert(with: String)
    
}
