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
    
    let autoCompleteErrorMessage = "Ошибка при выполнении поиска!"
    
    init(delegate: AutoCompleteDelegate) {
        super.init()
        self.autoCompleteDelegate = delegate
        autoCompleteController.delegate = self
    }
    
    // MARK: - AutoCompleteControllerProtocol
    
    func getAutoCompleteController() -> UIViewController {
        return autoCompleteController
    }
    
    // MARK: - GMSAutoCompleteViewControllerDelegate
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {

        let latitude = place.coordinate.latitude
        let longitude = place.coordinate.longitude
        let placeName = place.name
        let placeFormattedAddress = place.formattedAddress
        
        let searchedPlace = Place(latitude: latitude, longitude: longitude, placeName: placeName, placeFormattedAddress: placeFormattedAddress)
        
        autoCompleteDelegate.cityIsDefined(name: searchedPlace.placeName, place: searchedPlace)
        autoCompleteDelegate.didFinishAutoComplete()
//        autoCompleteDelegate.show(place: searchedPlace)

    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        autoCompleteDelegate.showAutoCompleteError(with: autoCompleteErrorMessage)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        autoCompleteDelegate.didFinishAutoComplete()
    }
    
}
