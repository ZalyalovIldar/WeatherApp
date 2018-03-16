//
//  AutoCompleteManager.swift
//  WeatherApp
//
//  Created by Elina on 16/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import GooglePlaces

class AutoCompleteManager: NSObject, AutoCompleteManagerProtocol {
    
    let autoCompleteController = GMSAutocompleteViewController()
    
    // MARK: - AutoCompleteControllerProtocol
    
    func showController(after controller: UIViewController) {
        
        self.autoCompleteController.delegate = controller as? GMSAutocompleteViewControllerDelegate
        controller.present(autoCompleteController, animated: true, completion: nil)
        
    }
    
    func closeAutoCompleteController(next controller: UIViewController) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
}
