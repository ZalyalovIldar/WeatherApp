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
    
    let zero: CGFloat = 0
    let constraintConst: CGFloat = 120
    let buttonFrameSize: CGFloat = 30
    let fontSize: CGFloat = 10
    
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
    
    func setCamera(latitude: Double, longitude: Double, placeName: String, image: UIImage) {

        camera.centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        self.mapView.setCamera(camera, animated: true)
        
        let marker = PinView(with: latitude, and: longitude, with: placeName)
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
        
        let imageView = UIImageView();
        let pinImage = pin.image;
        imageView.image = pinImage;
        imageView.addConstraint(NSLayoutConstraint(
            item: imageView,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: zero,
            constant: constraintConst))
        
        imageView.addConstraint(NSLayoutConstraint(
            item: imageView,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.equal,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: zero,
            constant: constraintConst))
        
        annotationView?.detailCalloutAccessoryView = imageView
        
        
        let leftAccessory = UILabel()
        leftAccessory.font = UIFont(name: pin.title!, size: fontSize)
        annotationView?.leftCalloutAccessoryView = leftAccessory
        
        let button = UIButton(type: .infoDark)
        button.frame = CGRect(x: zero, y: zero, width: buttonFrameSize, height: buttonFrameSize)
        
        annotationView?.rightCalloutAccessoryView = button
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        //open next view
        
    }
    


}
