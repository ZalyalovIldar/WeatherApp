//
//  MapInitializer.swift
//  WeatherApp
//
//  Created by Elina on 16/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

class MapInitializer: NSObject {
    
    @IBOutlet weak var viewController: MapView!
    
    override func awakeFromNib() {
        let _ = MapConfigurator.setUpModule(with: viewController)
    }
    
}
