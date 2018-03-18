//
//  ViewControllerInitiate.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//


import Foundation
import UIKit

extension UIViewController {
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboards) -> Self {
        
        return appStoryboard.viewController(viewControllerClass: self)
    }
}

