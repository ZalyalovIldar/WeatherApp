//
//  MapRouter.swift
//  WeatherApp
//
//  Created by Elina on 09/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit

class MapRouter: MapRouterProtocol {
    
    weak var view: UIViewController!
    
    var autoCompleteController: AutoCompleteManagerProtocol!
    
    // MARK: - MapRouterProtocol
    
    func showAutoCompleteController() {
        autoCompleteController.showController(after: view)
    }
    
    func closeAutoCompleteController() {
        autoCompleteController.closeAutoCompleteController(next: view)
    }

}
