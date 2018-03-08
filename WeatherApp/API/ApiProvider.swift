//
//  ApiProvider.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 08.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol ApiProvider {
    
    var baseURL: URL? { get }
    
    func makeRequest(with request: Request, completionBlock: @escaping (Data?) -> Void)
    
}
