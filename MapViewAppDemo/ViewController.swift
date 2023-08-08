//  /*
//
//  Project: MapViewAppDemo
//  File: ViewController.swift
//  Created by: Elaidzha Shchukin
//  Date: 08.08.2023
//
//  */

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad(_ animateed: Bool) {
        super.viewDidLoad(animated)
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocation locations: [CLLocation]) {
        if let location = locations.first {
            locationManager.stopUpdatingLocation()
            
            render(location)
        }
    }
    
    func render(_ location: CLLocation) {
        
        let coorinate = CLLocation(latitude: location.coordinate.latitude , longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let regino = MKCoordinateRegion(center: coorinate, span: span)
    }
}

