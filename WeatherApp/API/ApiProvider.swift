//
//  ApiProvider.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 08.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol ApiProvider {
    
    /// Base URL of API
    var baseURL: URL? { get }
    
    /// Send request to API
    ///
    /// - Parameters:
    ///   - request: prepared request with parameters
    ///   - completionBlock: result block with data
    func makeRequest(with request: Request, completionBlock: @escaping (Data?) -> Void)
    
}
