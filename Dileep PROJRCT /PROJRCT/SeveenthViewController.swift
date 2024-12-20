//
//  SeveenthViewController.swift
//  PROJRCT
//
//  Created by FCI on 13/12/24.
//

import UIKit
import CoreLocation

class SeveenthViewController: UIViewController, CLLocationManagerDelegate {



   @IBOutlet var l1: UILabel!
    @IBOutlet var l2: UILabel!
    @IBOutlet var l3: UILabel!
    
    @IBOutlet var b1: UIButton!
    @IBOutlet var b2: UIButton!
    
    @IBOutlet var l4: UILabel!
    @IBOutlet var l5: UILabel!
    @IBOutlet var l6: UILabel!
    
    @IBOutlet var b3: UIButton!
    
    @IBOutlet  var bar: UIBarButtonItem?
    
    var locationManager: CLLocationManager!
    
    var lat : Double = 0.0
    var long : Double = 0.0

    var locality1: String?
    var latitude: String!
    var longitude: String!
    var temperaturevalue: String!
    var address: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup CLLocationManager
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
    }
    
    @IBAction func currentButtonClick() {
        // Check if location services are enabled
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
        }
    }
    
    // CLLocationManager Delegate method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        lat = location.coordinate.latitude
        long = location.coordinate.longitude
        
        print("Latitude: \(lat), Longitude: \(long)")
        
        // Update labels with current latitude and longitude
        l1.text = "Latitude: \(lat)"
        self.l1?.textColor = .white
        l2.text = "Longitude: \(long)"
        self.l2?.textColor = .white
        
        
        latitude = String(lat)
        longitude = String(long)
        
        // Reverse Geocoding to get the human-readable address
        let currentLocation = CLLocation(latitude: lat, longitude: long)
            
            CLGeocoder().reverseGeocodeLocation(currentLocation) { (placemarks, error) in
                if let error = error {
                    print("Error in reverse geocoding: \(error.localizedDescription)")
                    self.l3.text = "Unable to fetch address"
                    
                    return
                }
                
                if let placemark = placemarks?.first {
                    let name = placemark.name ?? "Unknown"
                    let country = placemark.country ?? "Unknown"
                    let administrativeArea = placemark.administrativeArea ?? "Unknown"
                    let locality1 = placemark.locality ?? "Unknown"
                    let postalCode = placemark.postalCode ?? "Unknown"
                    
                    // Display the full address
                    let address = "\(name), \(country), \(administrativeArea), \(locality1), \(postalCode)"
                    self.l3.text = address
                    self.l3?.textColor = .white
                    self.address = address
                }
            }
        }
    @IBAction func weatherInfoButtonClick() {
        
        // After getting the current location, fetch the weather information
        fetchWeatherData()
    }
    
    // Fetch Weather Data using latitude and longitude
    func fetchWeatherData() {
        // Construct the weather API URL using the current latitude and longitude
        let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=f31356634fbc4c64c86edd02aaf817c2&units=metric")!
        
        let session = URLSession.shared
        let task = session.dataTask(with: weatherURL) { (data, response, error) in
            if let error = error {
                print("Weather API Error: \(error)")
                return
            }
            
            if let data = data {
                // Parse the weather data from the response
                if let weatherData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                    
                    // Get the main weather information (temperature, humidity)
                    if let main = weatherData["main"] as? [String: Any] {
                        if let temperature = main["temp"] as? Double {
                            DispatchQueue.main.async {
                                self.l4.text = "Temperature: \(temperature)°C"
                                self.l4?.textColor = .white
                                self.temperaturevalue = "\(temperature)" // Update the property
                            }
                        }
                        if let humidity = main["humidity"] as? Double {
                            DispatchQueue.main.async {
                                self.l5.text = "Humidity: \(humidity)%"
                                self.l5?.textColor = .white
                            }
                        }
                    }
                    
                    // Get the wind information
                    if let wind = weatherData["wind"] as? [String: Any] {
                        if let windSpeed = wind["speed"] as? Double {
                            DispatchQueue.main.async {
                                self.l6.text = "Wind Speed: \(windSpeed) m/s"
                                self.l6?.textColor = .white
                            }
                        }
                    }
                }
            }
        }
        
        task.resume()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            let nextScreen = segue.destination as! EighthViewController
        
       
        nextScreen.title = locality1
            nextScreen.lat = latitude
            nextScreen.long = longitude
            nextScreen.temp = temperaturevalue
            nextScreen.address = address
        nextScreen.locality = locality1
        
        print("Temperature: \(temperaturevalue ?? "nil")")
        }
    @IBAction func barClick() {
            
            self.navigationController?.popToRootViewController(animated: true)
            
        }
  
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



    

