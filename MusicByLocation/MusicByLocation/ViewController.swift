//
//  ViewController.swift
//  MusicByLocation
//
//  Created by Aaron Rex on 26/02/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import UIKit

import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    
    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation,
                                            completionHandler: { (placemarks, error) in
                                                if error != nil {
                                                    self.musicRecommendations.text = "Could not perform lookup of location for latitude: \(firstLocation.coordinate.latitude.description)"
                                                } else {
                                                    self.musicRecommendations.text = "\(placemarks?[0].locality ?? "YoYo"), \(placemarks?[0].subLocality ?? "YoYo"), \(placemarks?[0].country ?? "YoYo"), \(placemarks?[0].postalCode ?? "")"
                                                }
                                                
            })
            musicRecommendations.text = firstLocation.coordinate.latitude.description
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user's location. Error: \(error.localizedDescription)"
    }


    @IBAction func findName(_ sender: Any) {
        locationManager.requestLocation()
        
    }

}

