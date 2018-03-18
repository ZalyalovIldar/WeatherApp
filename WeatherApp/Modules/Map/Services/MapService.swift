//
//  MapService.swift
//  WeatherApp
//
//  Created by Elina on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol MapService: class {
    
    /// To get coat of arms with request
    ///
    /// - Parameters:
    ///   - request: request to get image
    ///   - completionBlock: for response
    func getCoatOfArms(with request: Request, completionBlock: @escaping (Response<MapInfo>) -> Void)
    
}
