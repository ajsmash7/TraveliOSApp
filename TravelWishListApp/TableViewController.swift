//
//  TableViewController.swift
//  TravelWishListApp
//
//  Created by AJMac on 4/8/19.
//  Copyright © 2019 AJMac. All rights reserved.
//

import UIKit
import CoreLocation

class TableViewController: UITableViewController {
    
    // declare an instance of the placeList
    var placeModel: PlaceList!
    
    // add a new place to the list. If it's new, it hasn't been visited yet.
    func addNewPlace(_ sender: Any, name: String, hasVisited: Bool, coordinate: CLLocationCoordinate2D, locString: String) {
        
        let place = Place(name: name, hasVisited: false, coordinate: coordinate, locString: locString)
                let index = self.placeModel.add(place)
                let indexPath = IndexPath(row: index, section: 0)
                self.tableView.insertRows(at:[indexPath], with: .automatic)
    }
    
    // return the number of rows currently in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeModel.count()
    }
    
    // override the cell function to display the place name and city, state
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place = placeModel.getPlace(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = place?.name
        cell.detailTextLabel?.text = place?.locString
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
}
