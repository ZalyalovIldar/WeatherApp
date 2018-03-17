//
//  SegueHandler.swift
//  WeatherApp
//
//  Created by Тимур Шафигуллин on 14.03.18.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

/// Helper to provide segues more safety
protocol SegueHandler {
    
    associatedtype viewControllerSegue: RawRepresentable
    
    /// Get segue identifier
    ///
    /// - Parameter segue: segue to destionation view controller
    /// - Returns: segue identifier as enum
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
