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

class MapView: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, GMSAutocompleteViewControllerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPLocationManager()
        setUpMap()
    }
    
    func setUPLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func setUpMap() {
        
        mapView.showsUserLocation = true
        let buttonItem = MKUserTrackingBarButtonItem(mapView: mapView)
        self.navigationItem.leftBarButtonItem = buttonItem
        
    }
    
    // MARK: CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while get location \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        let camera = mapView.camera
        camera.centerCoordinate = CLLocationCoordinate2DMake((location?.coordinate.latitude)!, (location?.coordinate.longitude)!)
        
        self.mapView.setCamera(camera, animated: true)
        
        self.locationManager.stopUpdatingLocation()
        
    }
    
    // MARK: GMSAutocompleteViewControllerDelegate
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        let camera = mapView.camera
        camera.centerCoordinate = CLLocationCoordinate2DMake(place.coordinate.latitude, place.coordinate.longitude)
        
        self.mapView.setCamera(camera, animated: true)
        self.dismiss(animated: true, completion: nil)
        
        var markerTitle = place.name
        
        if let address = place.formattedAddress {
            markerTitle = place.name + " " + address
        }
        
        let marker = PinView(with: place.coordinate.latitude, and: place.coordinate.longitude, with: markerTitle)
        
        mapView.addAnnotation(marker)
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error auto complete \(error)")
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // -MARK: Button action
    
    @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
        let autoCompleteController = GMSAutocompleteViewController()
        autoCompleteController.delegate = self
        
        self.locationManager.startUpdatingLocation()
        self.present(autoCompleteController, animated: true, completion: nil)
    }
    
}



