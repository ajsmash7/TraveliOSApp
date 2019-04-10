//
//  MapViewController.swift
//  TravelWishListApp
//
//  Created by AJMac on 4/8/19.
//  Copyright © 2019 AJMac. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()
    let regionRadius: CLLocationDistance = 1000
    var places = [PlaceList].self
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
        mapView.showsPointsOfInterest = true
        
    }
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
    }
    @IBAction func addLocation(_ sender: Any) {
        
        
    }
    // request permission to access location
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        if status == .authorizedWhenInUse{
            mapView.showsUserLocation = true
            moveToCurrentLocation()
        } else {
            let alert = UIAlertController(title: "Can't Display Location", message: "Please grant permission in settings", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default,
                                          handler: { (action: UIAlertAction) -> Void in UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!)}))
            present (alert, animated: true, completion: nil)
        }
        
        
    }
    // call mapView function to with Location parameter to center the view on the coordinates within a set region size
    func centerMapToLocation (location: CLLocation) {
        let viewRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(viewRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKPointAnnotation {
            let pinAnnotation = MKPinAnnotationView()
            pinAnnotation.pinTintColor = UIColor.cyan
            pinAnnotation.annotation = annotation
            pinAnnotation.canShowCallout = true
            return pinAnnotation
        }
        return nil
    }
    
}
