//
//  GoogleQueryApiManager.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 19.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit

protocol GoogleQueryApiManager {
    
    func getFirstImage(with query: String, completionBlock: @escaping (UIImage) -> ())
}
