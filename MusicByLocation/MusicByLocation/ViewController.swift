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
    let iTunesAdaptor = ITunesAdaptor()
    let locationManagerDelegate = LocationManagerDelegate()
    
    @IBOutlet var musicRecommendations: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = locationManagerDelegate
        locationManagerDelegate.vc = self
    }
    
    func updateDisplay(text: String?) {
        musicRecommendations.text = text
    }
    

    func getLocationBreakdown(placemark: CLPlacemark) -> String {
        return
            """
            Street: \(placemark.thoroughfare ?? "None")
            Locality: \(placemark.locality ?? "None")
            Area: \(placemark.administrativeArea ?? "None")
            Country: \(placemark.country ?? "None")
            """
    }

    
    func updateArtistsByLocation(text: String?) {
        iTunesAdaptor.getArtists(search: text) { (artists) in
            let names = artists?.map { return $0.artistName }
            self.musicRecommendations.text = names?.joined(separator: ", ")
        }
    }
    
    @IBAction func findMusic(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    
    

}

