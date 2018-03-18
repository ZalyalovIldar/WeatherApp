//
//  WeatherInfoInitializer.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 12.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class WeatherInfoInitializer: NSObject {
    
    @IBOutlet weak var viewController: WeatherInfoViewController!
    
    override func awakeFromNib() {
        let configurator = WeatherInfoConfigurator()
        configurator.setupModule(with: viewController)
    }
    
}
