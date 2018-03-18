//
//  MapManagerImplementation.swift
//  WeatherApp
//
//  Created by BLVCK on 18/03/2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import Foundation
import MapKit

class MapManagerImplemetnation: NSObject, MapManager {
    
    var queryManager: GoogleQueryApiManager!
    var delegate: MapButtonDelegate?
    
    func configure(with mapView: MKMapView) {
        mapView.delegate = self
    }
    
    init(delegate: MapButtonDelegate) {
        self.delegate = delegate
    }
    
    @objc func onButtonClick() {
        delegate?.onMapButtonClick()
    }
}

extension MapManagerImplemetnation: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var av = mapView.dequeueReusableAnnotationView(withIdentifier: "id")
        if av == nil {
            av = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "id")
        }
        
        if let value = annotation.title ?? nil {
            let request = "\(value) герб"  // "hello\n"
            
            
            //guard let test1 = annotation.title else { return nil }
            //var request = "\(test1) герб"
            print("ТЕКСТ ЗАПРОСА \(request)")
            
            let myView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 200))
            
            queryManager.getFirstImage(with: request, completionBlock: { (image) in
                let resizedImage = image.resizedImageWithinRect(rectSize: CGSize(width: 200, height: 200))
                DispatchQueue.main.async {
                    myView.image = resizedImage
                    
                }
            })
            let smallSquare = CGSize(width: 30, height: 30)
            let button = UIButton(frame: CGRect(origin: .zero, size: smallSquare))
            button.setBackgroundImage(UIImage(named: "arrow"), for: .normal)
            //button.setTitle(">", for: .normal)
            button.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
            
            av!.rightCalloutAccessoryView = button
            //myView.backgroundColor = .green
            
            let widthConstraint = NSLayoutConstraint(item: myView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
            myView.addConstraint(widthConstraint)
            
            let heightConstraint = NSLayoutConstraint(item: myView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
            myView.addConstraint(heightConstraint)
            
            av!.detailCalloutAccessoryView = myView
            av!.canShowCallout = true
        }
        
        return av!
        //        if (annotation is MKUserLocation) {
        //            //if annotation is not an MKPointAnnotation (eg. MKUserLocation),
        //            //return nil so map draws default view for it (eg. blue dot)...
        //            return nil
        //        }
        //
        //        let reuseId = "test"
        //
        //        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        //        if anView == nil {
        //            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        //            var image = UIImage(named: "герб")
        //            let resizedImage = image?.resizedImageWithinRect(rectSize: CGSize(width: 50, height: 50))
        //            //anView?.image = resizedImage
        //            anView?.detailCalloutAccessoryView = UIImageView(image:UIImage(named:"герб"))
        //            anView?.canShowCallout = true
        //        }
        //        else {
        //            //we are re-using a view, update its annotation reference...
        //            anView?.annotation = annotation
        //        }
        //
        //        return anView
    }
    
}
