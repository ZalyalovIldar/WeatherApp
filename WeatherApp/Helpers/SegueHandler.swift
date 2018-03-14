//
//  SegueHandler.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 14.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

protocol SegueHandler {
    
    associatedtype viewControllerSegue: RawRepresentable
    func segueIdentifierCase(for segue: UIStoryboardSegue) -> viewControllerSegue
    
}

extension SegueHandler where Self: UIViewController, viewControllerSegue.RawValue == String {
    
    func segueIdentifierCase(for segue: UIStoryboardSegue) -> viewControllerSegue {
        guard let identifier = segue.identifier,
            let identifierCase = viewControllerSegue(rawValue: identifier) else {
                fatalError("Could not map segue identifier -- \(String(describing: segue.identifier)) -- to segue case")
        }
        return identifierCase
    }
}
