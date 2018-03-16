//
//  AutoCompleteDelegate.swift
//  WeatherApp
//
//  Created by Elina on 16/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol AutoCompleteDelegate {
    
    func didFinishAutoComplete()
    
    func show(place: Place)
    
}
