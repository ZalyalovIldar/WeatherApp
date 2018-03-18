//
//  MapService.swift
//  WeatherApp
//
//  Created by Elina on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MapService: class {
    
    func getCoatOfArms(with request: Request, completionBlock: @escaping (Response<MapInfo>) -> Void)
    
}
