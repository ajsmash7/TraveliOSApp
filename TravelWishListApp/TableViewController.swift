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
    func addNewPlace(_ sender: Any, place: Place) {
                let index = self.placeModel.add(place)
                let indexPath = IndexPath(row: index, section: 0)
                self.tableView.insertRows(at:[indexPath], with: .automatic)
    }
    
    // return the number of rows currently in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return placeModel.places.count
        
    }
    
    // override the cell function to use the cell custom class
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // declare a reusable cell style as a PlaceCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! PlaceCell
        // store the place information of the row selected into a variable
        let place = placeModel.getPlace(at: indexPath.row)
        
        // get the string value of hasVisited to display in the cell
        let visitValue = placeModel.getVisitedValue(at: indexPath.row)
            
        //set cell values
        cell.nameLabel.text = place?.name
        cell.locationLabel.text = place?.locString
        cell.visitedLabel.text = visitValue
        cell.backgroundColor = place?.TintColor
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let placeMapView = segue.destination as! MapViewController
            let rowsSelected = tableView.indexPathsForSelectedRows
            let place = placeModel.getPlace(at: (rowsSelected?[0].row)!)
            placeMapView.place = place
            
            
        }
    }
    
    
    
}
