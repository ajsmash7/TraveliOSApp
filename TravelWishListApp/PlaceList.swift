//
//  PlaceList.swift
//  TravelWishListApp
//
//  Created by AJMac on 4/9/19.
//  Copyright © 2019 AJMac. All rights reserved.
//

import Foundation
import CoreLocation

class PlaceList {
    
    var places = [Place]()
    
    @discardableResult func add(_ place:Place) -> Int {
        places.append(place)
        return places.endIndex-1
    }
    
    func getPlace(at index: Int) -> Place? {
        if places.indices.contains(index){
            return places[index]
        }
        return nil
    }
    
    func count() -> Int {
        return places.count
    }
    
    
    func getVisitedValue(at index: Int) -> String?{
        if places.indices.contains(index){
            switch places[index].hasVisited {
            case true?:
                return "Visited"
            case false?:
                return "Not Visited"
            default:
                return "Error"
            }
        
        }else {
            return nil
        }
    
        
    }
    
}
