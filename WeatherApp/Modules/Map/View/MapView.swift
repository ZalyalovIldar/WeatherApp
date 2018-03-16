//
//  DemoView.swift
//  WeatherApp
//
//  Created by Elina on 14/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import MapKit
import GooglePlaces

class MapView: UIViewController, MKMapViewDelegate, GMSAutocompleteViewControllerDelegate, MapViewInput {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var presenter: MapViewOutput!
    
    var camera: MKMapCamera!
    
    override func viewDidLoad() {
        
        //Move to configurator
//        let presenter = MapPresenter()
//        let interactor = MapInteractor()
//        let router = MapRouter()
//
//        presenter.view = self
//        presenter.interactor = interactor
//        presenter.router = router
//        self.presenter = presenter
        //
        
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    // MARK: - MapViewInput
    
    func setUserLocation(latitude: Double, longitude: Double) {
        camera.centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude)
        self.mapView.setCamera(camera, animated: true)
    }
    
    func setUpMap() {
        
        mapView.showsUserLocation = true
        let buttonItem = MKUserTrackingBarButtonItem(mapView: mapView)
        self.navigationItem.leftBarButtonItem = buttonItem
        self.camera = mapView.camera
    }
    
    func getUserLocation() {
        presenter.getCoordinates()
    }
    
 
    
    // MARK: - GMSAutocompleteViewControllerDelegate
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
                
        let latitude = place.coordinate.latitude
        let longitude = place.coordinate.longitude
        
        camera.centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude)
    
        self.mapView.setCamera(camera, animated: true)
        
        presenter.didFinishAutoComplete()
        
        var markerTitle = place.name
        
        if let address = place.formattedAddress {
            markerTitle = place.name + " " + address
        }
        
        let marker = PinView(with: latitude, and: longitude, with: markerTitle)
        
        mapView.addAnnotation(marker)
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error auto complete \(error)")
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        presenter.didFinishAutoComplete()
    }
    
    // MARK: - Button action
    
    @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
        presenter.searchPlaces()
    }
    
}



