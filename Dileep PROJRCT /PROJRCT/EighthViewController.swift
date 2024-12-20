import UIKit
import MapKit
import QuartzCore

class EighthViewController: UIViewController {
    
    @IBOutlet var mv2: MKMapView!
    @IBOutlet var sc2: UISegmentedControl!
    @IBOutlet var b1: UIButton!
    
    
    @IBOutlet  var homeButton: UIBarButtonItem!
    
    var locality : String!
        var lat: String!
        var long: String!
    var loc: String!
        var temp: String!
        var address : String!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let staticLocation = CLLocationCoordinate2D(latitude: Double(lat ?? "") ?? 0.0, longitude: Double(long ?? "") ?? 0.0)
            
            
            let span1 = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
            
            let region1 = MKCoordinateRegion(center: staticLocation, span: span1)
            
            mv2.setRegion(region1, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = staticLocation
            annotation.title = "Address: \(address!)"
            annotation.subtitle = "Temperature : \(temp!)"
            mv2.addAnnotation(annotation)
            
        }
        
        @IBAction func sc2Click() {
            
            if sc2.selectedSegmentIndex == 0
            {
                mv2.mapType = .standard
            }  else if sc2.selectedSegmentIndex == 1 {
                mv2.mapType = .satellite
            } else {
                mv2.mapType = .hybrid
            }
        }
    // Method to share the weather information
       @IBAction func infoButtonClick() {
           // Prepare the weather info string
           let weatherInfo = """
           Weather Info:
           Location: \(address ?? "Unknown Location")
           Latitude: \(lat ?? "Unknown Latitude")
           Longitude: \(long ?? "Unknown Longitude")
           Temperature: \(temp ?? "Unknown Temperature")
           """
           
           // Create the activity view controller for sharing
           let activityVC = UIActivityViewController(activityItems: [weatherInfo], applicationActivities: nil)
           // Present the activity view controller
           present(activityVC, animated: true, completion: nil)
       }
    @IBAction func homeButtonClick() {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    // Method to share the weather information
               @IBAction func b1Click() {
                   // Prepare the text you want to share
                   let weatherInfo = """
                   Location: \(loc!)
                   Address: \(address!)
                   Temperature: \(temp!)
                   """
                   
                   // Create an activity view controller to share the information
                   let activityVC = UIActivityViewController(activityItems: [weatherInfo], applicationActivities: nil)
                   // Present the activity view controller
                   present(activityVC, animated: true, completion: nil)
               }
           }
    
   
