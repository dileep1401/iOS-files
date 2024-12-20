//
//  FifthViewController.swift
//  PROJRCT
//
//  Created by FCI on 13/12/24.
//

import UIKit
import CoreLocation

class FifthViewController: UIViewController {
    
    @IBOutlet weak var txf1: UITextField!
    
    @IBOutlet  var homeButton: UIBarButtonItem?
    
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var l4: UILabel!
    @IBOutlet weak var l5: UILabel!
    @IBOutlet weak var l6: UILabel!
    @IBOutlet weak var l7: UILabel!
    
    
    @IBOutlet weak var b1 : UIButton!
    @IBOutlet weak var b2: UIButton!
    
    let locationManager = CLLocationManager()
    var latitude: String!
    var longitude: String!
    var temperatureValue: String!
    var administrativeArea: String!
    var locality: String!
    var windSpeed: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func b1Click(_ sender: UIButton) {
        
        let session1 = URLSession.shared
        
        let webserviceURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(txf1.text!)&APPID=f31356634fbc4c64c86edd02aaf817c2&units=metric")!
        
        print("Sending Request --> Webservice URL:\n\(webserviceURL)")
        
       
        
        let task1 = session1.dataTask(with: webserviceURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error1 = error
            {
                print("Error:\n\(error1)")
            }
            else
            {
                if let data1 = data
                {
                    
                    print("Bytes Data:\n\(data1)")
                    
                    
                    let dataString = String(data: data1, encoding: String.Encoding.utf8)
                    
                    print("All the weather data:\n\(dataString!)")
                    
                    
                    
                    if let firstDictionary = try? JSONSerialization.jsonObject(with: data1, options: .allowFragments) as? NSDictionary
                    {
                        
                        print("first Dictionary values: \(firstDictionary)")
                        
                        if let secondDictionary = firstDictionary.value(forKey: "main") as? NSDictionary {
                            
                            print("main Dictionary values are: \(secondDictionary)")
                            
                            
                            
                            
                            if let temperaturevalue = secondDictionary.value(forKey: "temp") {
                                DispatchQueue.main.async {
                                    print("\(self.txf1.text!): \(temperaturevalue)°C")
                                    self.l3.text = "\(self.txf1.text!) Temperature: \(temperaturevalue)°C"
                                    self.l3?.textColor = .white
                                    self.temperatureValue = "Temperature: \(temperaturevalue)"
                                }
                            }
                            
                            if let humidityValue = secondDictionary.value(forKey: "humidity") {
                                DispatchQueue.main.async {
                                    print("\(self.txf1.text!): \(humidityValue)°C")
                                    self.l4.text = "\(self.txf1.text!) Humidity: \(humidityValue)"
                                    self.l4?.textColor = .white
                                }
                            }
                            if let fourthDictionary = firstDictionary.value(forKey: "wind") as? NSDictionary {
                                                                // To display wind
                                                                if let speedvalue = fourthDictionary.value(forKey: "speed") {
                                                                    DispatchQueue.main.async {
                                                                        self.l5.text = "WindSpeed: \(speedvalue)"
                                                                        self.l5?.textColor = .white
                                                                    }
                                                                }
                                                            }
                            if let thirdDictionary = firstDictionary.value(forKey: "coord") as? NSDictionary {
                                
                                if let latValue = thirdDictionary.value(forKey: "lat") {
                                    DispatchQueue.main.async {
                                        self.l1.text = "Latitude: \(latValue)"
                                        self.l1?.textColor = .white
                                        self.latitude = "\(latValue)"
                                    }
                                }
                                
                                
                                if let longValue = thirdDictionary.value(forKey: "lon") {
                                    DispatchQueue.main.async {
                                        self.l2.text = "Longitude: \(longValue)"
                                        self.l2?.textColor = .white
                                        self.longitude = "\(longValue)"
                                        
                                    }
                                }
                                
                                if let latitude = thirdDictionary.value(forKey: "lat") as? Double,
                                   let longitude = thirdDictionary.value(forKey: "lon") as? Double {
                                    let location = CLLocation(latitude: latitude, longitude: longitude)
                                    CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                                        if error != nil {
                                            let alert = UIAlertController(title: "Geocoding error", message: "Invalid Details.", preferredStyle: .alert)
                                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                                            self.present(alert, animated: true)
                                            return
                                        } else if let placemark = placemarks?.first {
                                            DispatchQueue.main.async {
                                                
                                                let name = placemark.name ?? "Unknown"
                                                let country = placemark.country ?? "Unknown"
                                                let administrativeArea = placemark.administrativeArea ?? "Unknown"
                                                let locality = placemark.locality ?? "Unknown"
                                                let postalCode = placemark.postalCode ?? "Unknown"
                                                
                                                self.administrativeArea = "\(administrativeArea)"
                                                self.l7?.textColor = .white
                                                self.locality = "\(locality)"
                                                
                                                self.l7.text = """
                                                    \(name)
                                                    \(country)
                                                    \(administrativeArea)
                                                    \(locality)
                                                    \(postalCode)
                                                    """
                                                
                                            }
                                        }
                                    }
                                }
                                if let weatherArray = firstDictionary.value(forKey: "weather") as? NSArray,
                                                                   let firstWeather = weatherArray.firstObject as? NSDictionary,
                                                                   let descriptValue = firstWeather.value(forKey: "description") as? String {
                                                                    DispatchQueue.main.async {
                                                                        self.l6.text = "Description: \(descriptValue)"
                                                                        self.l6?.textColor = .white
                                                                    }
                                                                }
                            }
                        }
                    }
                }
            }
        }
                
                task1.resume()
                
            }
            
    @IBAction func b2(_ sender: UIButton) {
                
            }
            
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
                let nextScreen = segue.destination as! SixthViewController
                
                nextScreen.title = txf1.text
                nextScreen.lat = latitude
                nextScreen.long = longitude
                nextScreen.temp = temperatureValue
                nextScreen.admin = administrativeArea
                nextScreen.loc = locality
            }
    @IBAction func homeButtonClick() {
            
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

