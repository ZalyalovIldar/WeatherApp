//
//  GMSAutocompleteManager.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit

protocol GMSAutocompleteManager {
    
    var placeDelegate: PlaceDelegate? { get set }
    func configure(with searchBarController: inout UISearchController)
}

