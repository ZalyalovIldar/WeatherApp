//
//  AutoCompleteManagerProtocol.swift
//  WeatherApp
//
//  Created by Elina on 16/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit

protocol AutoCompleteManagerProtocol {
    
    func showController(after controller: UIViewController)
    
    func closeAutoCompleteController(next controller: UIViewController)
    
}
