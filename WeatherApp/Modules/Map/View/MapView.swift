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
    
    func setCamera(latitude: Double, longitude: Double, placeName: String, placeFormattedAddress: String?, image: UIImage) {

        camera.centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        self.mapView.setCamera(camera, animated: true)
        
        var markerTitle = placeName
        
        if let address = placeFormattedAddress {
            markerTitle = placeName + " " + address
        }
        
        let marker = PinView(with: latitude, and: longitude, with: markerTitle)
        marker.image = image
        
        mapView.addAnnotation(marker)
    }
    
    // MARK: - Button action
    
    @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
        presenter.searchPlaces()
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        if !(annotation is PinView){
            return nil
        }
        
        var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        
        let pin = annotation as! PinView
        annotationView?.detailCalloutAccessoryView = UIImageView(image: pin.image)
        
        let leftAccessory = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 15))
        leftAccessory.font = UIFont(name: pin.title!, size: 7)
        annotationView?.leftCalloutAccessoryView = leftAccessory
        
        let image = UIImage(named: "Image")
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setImage(image, for: UIControlState())
        annotationView?.rightCalloutAccessoryView = button
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let placemark = MKPlacemark(coordinate: view.annotation!.coordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)

        let launchOptions = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeTransit]
        mapItem.openInMaps(launchOptions: launchOptions)
    }

}
