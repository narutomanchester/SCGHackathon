//
//  MainViewController.swift
//  SCGHackathon
//
//  Created by Hoang Hiep Ho on 10/27/18.
//  Copyright © 2018 Gamedex. All rights reserved.
//

import UIKit
import MapKit

class MainViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()


        mapView.delegate = self

        addAnnotations(lat: 28.042895, long: 108.008864, name: "China", subname: "SK Factory")
        addAnnotations(lat: 33.770015, long: 90.438424, name: "China", subname: "SK Factory")
        addAnnotations(lat: 24.577100, long: 114.685631, name: "China", subname: "SK Factory")
        addAnnotations(lat: 745.1084230, long: 86.711426, name: "China", subname: "SK Factory")
        addAnnotations(lat: 32.124453, long: 106.917432, name: "China", subname: "SK Factory")
        addAnnotations(lat: 26.480407, long: 104.143213, name: "China", subname: "SK Factory")
        addAnnotations(lat: 24.256981, long: 101.331943, name: "China", subname: "SK Factory")
        addAnnotations(lat: 28.969701, long: 89.735453, name: "China", subname: "SK Factory")
        addAnnotations(lat: 31.998759, long: 83.058686, name: "China", subname: "SK Factory")
        addAnnotations(lat: 24.256981, long: 115.388295, name: "China", subname: "SK Factory")
        addAnnotations(lat: 28.352734, long: 102.386169, name: "China", subname: "SK Factory")
        addAnnotations(lat: 28.661671, long: 109.765754, name: "China", subname: "SK Factory")
        addAnnotations(lat: 34.930979, long: 91.492497, name: "China", subname: "SK Factory")
        addAnnotations(lat: 42.851806, long: 119.956609, name: "China", subname: "SK Factory")
        addAnnotations(lat: 31.400535, long: 112.954717, name: "China", subname: "SK Factory")
        
        addAnnotations(lat: 20.593683, long: 78.962883, name: "India", subname: "The Great Kabab Factory")
        
        addAnnotations(lat: 11.032864, long: 78.813259, name: "India", subname: "The Great Kabab Factory")
        addAnnotations(lat: 12.581371, long: 76.353397, name: "India", subname: "The Great Kabab Factory")
        addAnnotations(lat: 20.593683, long: 78.962883, name: "India", subname: "The Great Kabab Factory")
        addAnnotations(lat: 24.231938, long: 86.368548, name: "India", subname: "The Great Kabab Factory")
        addAnnotations(lat: 22.294179, long: 86.192844, name: "India", subname: "The Great Kabab Factory")
        addAnnotations(lat: 17.167034, long: 80.746007, name: "India", subname: "The Great Kabab Factory")
        addAnnotations(lat: 18.338884, long: 76.704806, name: "India", subname: "The Great Kabab Factory")
        addAnnotations(lat: 23.266581, long: 76.001989, name: "India", subname: "The Great Kabab Factory")
        addAnnotations(lat: 19.668453, long: 81.097416, name: "India", subname: "The Great Kabab Factory")
        addAnnotations(lat: 25.982737, long: 74.947762, name: "India", subname: "The Great Kabab Factory")
        addAnnotations(lat: 22.131443, long: 78.813259, name: "India", subname: "The Great Kabab Factory")
        addAnnotations(lat: 21.314964, long: 81.800234, name: "India", subname: "The Great Kabab Factory")
        addAnnotations(lat: 26.298340, long: 76.353397, name: "India", subname: "The Great Kabab Factory")
        
    }
    
    func addAnnotations(lat: Float, long: Float, name: String, subname: String){
        let CLLCoordType = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat),
                                                  longitude: CLLocationDegrees(long))
        
        let anno = MKPointAnnotation()
        anno.coordinate = CLLCoordType
        anno.title = subname
        anno.subtitle = name
        
        mapView.addAnnotation(anno)

    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//
//        let reuseId = "pin"
//        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
//        if pinView == nil {
//            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//          //  pinView?.animatesDrop = true
//
//           // pinView?.isDraggable = true
//
//            // pinView?.pinColor = .purple
//
//            let rightButton: AnyObject! = UIButton(type: UIButton.ButtonType.detailDisclosure)
//            pinView?.rightCalloutAccessoryView = rightButton as? UIView
//        }
//        else {
//            pinView?.annotation = annotation
//        }
//
//        if let pinView = pinView {
//            pinView.canShowCallout = true
//            pinView.image = UIImage(named: "pinLogo")
//        }
//
//        return pinView
//    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        let annotationIdentifier = "Identifier"
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {
            
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "pinLogo")
        }
        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailStaticsViewController") as! DetailStaticsViewController
//            vc.name.text = view.annotation?.title ?? "SK Factory"
//            vc.country.text = view.annotation?.subtitle ?? "China"
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
