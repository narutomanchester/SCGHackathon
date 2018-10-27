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

        addAnnotations(lat: 28.042895, long: 108.008864, name: "China")
        addAnnotations(lat: 33.770015, long: 90.438424, name: "China")
        addAnnotations(lat: 24.577100, long: 114.685631, name: "China")
        addAnnotations(lat: 745.1084230, long: 86.711426, name: "China")
        addAnnotations(lat: 32.124453, long: 106.917432, name: "China")
    }
    
    func addAnnotations(lat: Float, long: Float, name: String){
        let CLLCoordType = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat),
                                                  longitude: CLLocationDegrees(long))
        
        let anno = MKPointAnnotation()
        anno.coordinate = CLLCoordType
        anno.title = name
        
        mapView.addAnnotation(anno)

    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.animatesDrop = true
            pinView?.canShowCallout = true
            pinView?.isDraggable = true
            pinView?.image = UIImage(named: "pinLogo")
            // pinView?.pinColor = .purple
            
            let rightButton: AnyObject! = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = rightButton as? UIView
        }
        else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
