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
                                                    if let firstPlacemark = placemarks?[0] {
                                                        self.updateRecommendedArtists(search: firstPlacemark.locality)
                                                
                                                    }
                                                }
                                                
            })
            musicRecommendations.text = firstLocation.coordinate.latitude.description
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        musicRecommendations.text = "Could not access user's location. Error: \(error.localizedDescription)"
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


    @IBAction func findName(_ sender: Any) {
        locationManager.requestLocation()
        
    }
    
    func updateRecommendedArtists(search: String?) {
        let searchTerm = search?.components(separatedBy: " ").first ?? "Lionel"
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=musicArtist")
            else {
                print("Invalid URL, Not able to update recommended artists")
                
                return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.artistName
                    }
                    
                    DispatchQueue.main.async {
                        self.musicRecommendations.text = names.joined(separator: ",  ")
                    }
                                    }
            }
        }.resume()
        
        
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder =  JSONDecoder()
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Failed to decode Artist Response")
            return nil
        }
    
    }
    

}

