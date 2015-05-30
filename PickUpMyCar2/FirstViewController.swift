//
//  FirstViewController.swift
//  PickUpMyCar2
//
//  Created by Cristina Radulescu on 5/29/15.
//  Copyright (c) 2015 Cristina Radulescu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        
        mapView.myLocationEnabled = true
        mapView.settings.myLocationButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if status == .AuthorizedWhenInUse
        {

            locationManager.startUpdatingLocation()

            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
  
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        if let location = locations.first as? CLLocation
        {
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
    }


}

