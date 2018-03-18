//
//  AutoCompleteDelegate.swift
//  WeatherApp
//
//  Created by Elina on 16/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol AutoCompleteDelegate {
    
    /// Result of auto complete
    func didFinishAutoComplete()
    
    /// Show alert if auto complete finished with error
    ///
    /// - Parameter message: error message
    func showAutoCompleteError(with message: String)
    
    /// To define city
    ///
    /// - Parameters:
    ///   - name: city name
    ///   - place: struct Place
    func cityIsDefined(name: String, place: Place)
    
}
