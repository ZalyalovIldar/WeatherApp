//
//  EndPointProtocol.swift
//  WeatherApp
//
//  Created by Азат Алекбаев on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol EndPoint{
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}
