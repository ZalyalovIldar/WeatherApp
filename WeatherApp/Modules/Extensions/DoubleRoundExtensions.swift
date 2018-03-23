//
//  DoubleRoundExtensions.swift
//  WeatherApp
//
//  Created by BLVCK on 24/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
