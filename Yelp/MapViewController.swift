//
//  MapViewController.swift
//  Yelp
//
//  Created by Vicki Chun on 9/27/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
  
  @IBOutlet weak var mapView: MKMapView!
  
  var businesses: [Business]!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup Cancel button in navigation bar
    let listButton = UIBarButtonItem()
    listButton.title = "List"
    listButton.action = Selector("backToListView")
    listButton.target = self
    navigationItem.rightBarButtonItem = listButton
    
    navigationItem.title = "Map"
    
    mapView.delegate = self
    let coordinate: MKCoordinateRegion = MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.785771,-122.406165), MKCoordinateSpanMake(0.1,0.1))
    mapView.setRegion(coordinate, animated: false)
    
    if (businesses != nil) {
      for business in businesses {
        addPin(business.address!, name: business.name!)
      }      
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func backToListView() {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func addPin(address: String, name: String) {
    print("addpin for " + address)
    let geocoder = CLGeocoder()
    
    geocoder.geocodeAddressString(address) { (placeMarks: [CLPlacemark]?, error: NSError?) -> Void in
      if let placemark = placeMarks?[0] {
        let mkp : MKPlacemark = MKPlacemark(placemark: placemark)
        let annotation : MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = mkp.coordinate
        annotation.title = name
        annotation.subtitle = address
        self.mapView.addAnnotation(annotation)
      }
    }
  }
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
