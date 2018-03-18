//
//  ModuleInput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 13.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

/// Send data through this protocol
protocol ModuleInput: class {
    
    /// Setting data to input module
    ///
    /// - Parameter data: anything data
    func setData(_ data: Any?)
    
}
