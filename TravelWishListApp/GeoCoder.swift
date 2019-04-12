//
//  GeoCoder.swift
//  TravelWishListApp
//
//  Created by AJMac on 4/9/19.
//  Copyright © 2019 AJMac. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class GeoCoder: NSObject {
    
    let geoCoder = CLGeocoder()
    
    

    func getNewPlace (location: CLLocation) -> Place {
        
        var place: Place!
        
            geoCoder.reverseGeocodeLocation(location, preferredLocale: nil, completionHandler: { (placeMarks: [CLPlacemark]?, error:Error?) in
        
                if error == nil {
                    let placeMark = placeMarks![0]
                    let name = placeMark.name
                    let city = placeMark.locality
                    let state = placeMark.administrativeArea
                    let ctyCode = placeMark.isoCountryCode
                    let loc = "\(String(describing: city)), \(String(describing: state)), \(String(describing: ctyCode))"
                    let currentCoords = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                    
                    place = Place(name: name!, hasVisited: false, coordinate: currentCoords, locString: loc)
                    
                    
                } else {
                    place = nil
                }
            })
        return place
        }
    
}
