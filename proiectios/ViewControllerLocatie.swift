//
//  ViewControllerLocatie.swift
//  proiectios
//
//  Created by user216341 on 6/14/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewControllerLocatie: UIViewController {

        let map = MKMapView()
        let coordinate = CLLocationCoordinate2D(latitude: 40.728, longitude: -74)
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(map)
            map.frame = view.bounds
            
            map.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: false)
            
            addCustomPin()
        }
        
        private func addCustomPin(){
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            pin.title = "New York"
            pin.subtitle = "Este aici"
            map.addAnnotation(pin)
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            guard !(annotation is MKUserLocation) else{
                return nil
            }
            
            var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
            
            if annotationView == nil{
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
                annotationView?.canShowCallout = true
            }
            else{
                annotationView?.annotation = annotation
            }
            annotationView?.image = UIImage(named: "pin")
            
            return annotationView
        }
    }

    

