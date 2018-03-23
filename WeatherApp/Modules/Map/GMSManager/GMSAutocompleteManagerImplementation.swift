//
//  GMSAutocompleteManagerImplementation.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import UIKit
import GooglePlaces

protocol PlaceDelegate {
    func didLoadPlace(with place: GMSPlace)
}

class GMSAutocompleteManagerImplementation: NSObject, GMSAutocompleteManager {
    
    var resultsViewController: GMSAutocompleteResultsViewController = GMSAutocompleteResultsViewController()
    var resultSearchBarController:UISearchController?
    var placeDelegate: PlaceDelegate?
    
    override init() {
        super.init()
        resultsViewController.delegate = self
    }
    
    func configure(with searchBarController: inout UISearchController) {
        resultSearchBarController = UISearchController(searchResultsController: resultsViewController)
        resultSearchBarController?.searchResultsUpdater = resultsViewController
        searchBarController = resultSearchBarController!
    }
}

extension GMSAutocompleteManagerImplementation: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {
        resultSearchBarController?.isActive = false
        // Do something with the selected place.
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        placeDelegate?.didLoadPlace(with: place)
        
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: Error){
        print("Error: ", error.localizedDescription)
    }
    
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

