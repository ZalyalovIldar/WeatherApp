//
//  Response.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 08.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

/// Simple response with result
///
/// - success: result with entity
/// - error: error with message
enum Response<T> {
    case success(T)
    case error(String)
}
