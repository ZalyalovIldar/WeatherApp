//
//  WeatherInitializer.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherInitializer: NSObject {
    
    @IBOutlet weak var viewController: WeatherViewController!
    
    override func awakeFromNib() {
        WeatherConfigurator.setupModule(with: viewController)
    }
    
}
