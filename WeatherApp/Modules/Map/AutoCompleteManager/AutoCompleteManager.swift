//
//  AutoCompleteManager.swift
//  WeatherApp
//
//  Created by Elina on 16/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import GooglePlaces

class AutoCompleteManager: NSObject, AutoCompleteManagerProtocol, GMSAutocompleteViewControllerDelegate {
    
    var autoCompleteController = GMSAutocompleteViewController()
    
    var autoCompleteDelegate: AutoCompleteDelegate!
    
    init(with autoCompleteDelegate: AutoCompleteDelegate) {
        super.init()
        self.autoCompleteDelegate = autoCompleteDelegate
        setUpAutoCompleteManager()
    }
    
    func setUpAutoCompleteManager() {
        autoCompleteController.delegate = self
    }
    
    // MARK: - AutoCompleteControllerProtocol
    
    func getAutoCompleteController() -> UIViewController {
        return autoCompleteController as UIViewController
    }
    
    // MARK: - GMSAutoCompleteViewControllerDelegate
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {

        let searchedPlace = Place(place: place)
        
        autoCompleteDelegate.didFinishAutoComplete()
        autoCompleteDelegate.show(place: searchedPlace)

    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error auto complete \(error)")
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        autoCompleteDelegate.didFinishAutoComplete()
    }
    
}
