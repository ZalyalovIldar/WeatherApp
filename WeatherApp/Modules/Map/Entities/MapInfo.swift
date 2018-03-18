//
//  MapInfo.swift
//  WeatherApp
//
//  Created by Elina on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit

struct MapInfo: Codable {
    
    let value: [Value]
    
    struct Value: Codable {
        let contentUrl: URL
    }
    
}

extension MapInfo {
    
   
}


