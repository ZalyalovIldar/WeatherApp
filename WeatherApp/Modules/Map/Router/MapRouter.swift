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
    
    var autoCompleteManager: AutoCompleteManagerProtocol!
    
    var alertsFactory: CommonAlertsFactoryProtocol!
    
    // MARK: - MapRouterProtocol
    
    func showAutoCompleteController() {
        let controller = autoCompleteManager.getAutoCompleteController()
        view.present(controller, animated: true, completion: nil)
    }
    
    func closeAutoCompleteController() {
        view.dismiss(animated: true, completion: nil)
    }
    
    func showError(with message: String) {
        let alertController = alertsFactory.getErrorAlert(with: message)
        let currentController = autoCompleteManager.getAutoCompleteController()
        currentController.present(alertController, animated: true, completion: nil)
    }

}
