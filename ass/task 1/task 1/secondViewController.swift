import UIKit
import MapKit
import QuartzCore

class secondViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    var lat: String!
    var long: String!
    var temp: String!
    var admin: String!
    var loc: String!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let staticLocation = CLLocationCoordinate2D(latitude: Double(lat ?? "") ?? 0.0, longitude: Double(long ?? "") ?? 0.0)
        
        
        let span1 = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        
        let region1 = MKCoordinateRegion(center: staticLocation, span: span1)
        
        mapView.setRegion(region1, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = staticLocation
        annotation.title = "Address: \(admin), \(loc)"
        mapView.addAnnotation(annotation)
        
    }
    
    @IBAction func mapTypeChanged(_ sender: UISegmentedControl) {
        
        if segmentControl.selectedSegmentIndex == 0
        {
            mapView.mapType = .standard
        }  else if segmentControl.selectedSegmentIndex == 1 {
            mapView.mapType = .satellite
        } else {
            mapView.mapType = .hybrid
        }
    }
}
