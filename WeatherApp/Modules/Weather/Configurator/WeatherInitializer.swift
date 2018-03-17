//
//  WeatherInitializer.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 08.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class WeatherInitializer: NSObject {
    
    @IBOutlet weak var viewController: WeatherViewController!
    
    override func awakeFromNib() {
        let configurator = WeatherConfigurator()
        configurator.setupModule(with: viewController)
    }
    
}
