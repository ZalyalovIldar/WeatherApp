//
//  WeatherInfoInteractorInput.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 12.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherInfoInteractorInput: class {
    
    func convertAndSetColletionInfo(from weatherInfo: WeatherInfo)
    func updateCurrentInfo(at indexPath: IndexPath)
    func updateCurrentInfoCount()
    
}
