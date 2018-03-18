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

class MapView: UIViewController, MKMapViewDelegate, MapViewInput {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var presenter: MapViewOutput!
    
    var camera: MKMapCamera!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        presenter.viewIsReady()
    }
    
    // MARK: - MapViewInput
    
    func setUserLocation(latitude: Double, longitude: Double) {
        camera.centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude)
        self.mapView.setCamera(camera, animated: true)
    }
    
    func setCoatOfArmy(image: UIImage) {
        //set image
    }
    
    func setUpMap() {
        
        mapView.showsUserLocation = true
        let buttonItem = MKUserTrackingBarButtonItem(mapView: mapView)
        self.navigationItem.leftBarButtonItem = buttonItem
        self.camera = mapView.camera
        
        //
        mapView.delegate = self
    }
    
    func getUserLocation() {
        presenter.getCoordinates()
    }
    
    func setCamera(latitude: Double, longitude: Double, placeName: String, placeFormattedAddress: String?) {

        camera.centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        self.mapView.setCamera(camera, animated: true)
        
        var markerTitle = placeName
        
        if let address = placeFormattedAddress {
            markerTitle = placeName + " " + address
        }
        
        let marker = PinView(with: latitude, and: longitude, with: markerTitle)
        
        mapView.addAnnotation(marker)
    }
    
    // MARK: - Button action
    
    @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
        presenter.searchPlaces()
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let view = MKPinAnnotationView()
        view.pinTintColor = UIColor.blue
        
        return view
    }
    
}



