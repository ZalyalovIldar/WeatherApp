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
    var camera: MKMapCamera!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPLocationManager()
        setUpMap()
    }
    
    func setUPLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func setUpMap() {
        
        mapView.showsUserLocation = true
        let buttonItem = MKUserTrackingBarButtonItem(mapView: mapView)
        self.navigationItem.leftBarButtonItem = buttonItem
        self.camera = mapView.camera
    }
    
    // MARK: CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while get location \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        if let latitude = location?.coordinate.latitude, let longitude = location?.coordinate.longitude {
            camera.centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude)
            self.mapView.setCamera(camera, animated: true)
        }
        
        self.locationManager.stopUpdatingLocation()
        
    }
    
    // MARK: GMSAutocompleteViewControllerDelegate
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
                
        let latitude = place.coordinate.latitude
        let longitude = place.coordinate.longitude
        
        camera.centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude)
    
        self.mapView.setCamera(camera, animated: true)
        self.dismiss(animated: true, completion: nil)
        
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



