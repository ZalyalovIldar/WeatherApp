//
//  WeatherRouterProtocol.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 07.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

protocol WeatherRouterProtocol: class {
    
    func showErrorAlert(with message: String)
    func sendDataToCollectionCointainerView(_ data: Any?)
    func setCollectionContainerModuleInput(_ moduleInput: ModuleInput)
    
}
