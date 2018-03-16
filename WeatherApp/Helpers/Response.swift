//
//  Response.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 08.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

enum Response<T> {
    case success(T)
    case error(String)
}
