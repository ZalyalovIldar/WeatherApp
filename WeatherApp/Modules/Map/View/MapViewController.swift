//
//  MapViewController.swift
//  WeatherApp
//
//  Created by Damir Zaripov on 18.03.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit
import MapKit
import GooglePlaces

class MapViewController: UIViewController, MapViewInput {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var presenter: MapPresenter!
    var resultSearchController: UISearchController = UISearchController()
    var GMSManager: GMSAutocompleteManager = GMSAutocompleteManagerImplementation()
    var mapManager: MapManager!
    
    var currentPlace: GMSPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSManager.configure(with: &resultSearchController)
        presenter.configure(with: &GMSManager)
        resultSearchController.searchBar.sizeToFit()
        navigationItem.titleView = resultSearchController.searchBar
        definesPresentationContext = true
        resultSearchController.hidesNavigationBarDuringPresentation = false
        
        mapManager.configure(with: mapView)
        
        getLocation()
    }
    
    func getLocation() {
        presenter.getCurrentLocation()
    }
    
    func showCurrentLocationOnMap(with region: MKCoordinateRegion) {
        mapView.setRegion(region, animated: true)
    }
    
    func showCurrentCityOnMap(with place: GMSPlace) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = place.coordinate
        annotation.title = place.name
        
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(place.coordinate, span)
        mapView.setRegion(region, animated: true)
        
        self.currentPlace = place
    }
    
}

extension MapViewController: MapButtonDelegate {
    
    func onMapButtonClick() {
        guard let place = currentPlace else { return }
        var viewController = WheatherViewController.instantiate(fromAppStoryboard: .main)
        let moduleInput = WeatherConfigurator.setupModule(with: &viewController)
        moduleInput.setPlace(place)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}


