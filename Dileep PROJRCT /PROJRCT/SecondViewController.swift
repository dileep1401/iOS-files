//
//  SecondViewController.swift
//  PROJRCT
//
//  Created by FCI on 13/12/24.
//


// Imports the framework, which provides the necessary infrastructure for iOS apps.
import UIKit
import SafariServices
import WebKit
import QuartzCore

// Defines a ViewController class that manages the app's user interface.
class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Connects below different UIObjects from the storyboard to this code.
    @IBOutlet var table1 : UITableView!
    @IBOutlet var image : UIImageView!
    @IBOutlet var l1 : UILabel!
    @IBOutlet var l2 : UILabel!
    @IBOutlet var b1 : UIButton!
    //core animation
    var labelLayer : CALayer!
    var Button : CALayer!
    var imageviewLayer : CALayer!
    var screenviewLayer : CALayer!
   
    

    // Defining sections along with row data
    //section 1 : bus booking application names, url, logos
    var Section1Names : [String] = ["RedBus", "AbhiBus", "Goibibo"]
    var Section1URL : [String] = ["https://www.redbus.in","https://www.abhibus.com", "https://www.goibibo.com/bus/"]
    var Section1Images : [String] =  ["red", "Abhi-2", "Makemy.jpg"]
    
    //section 2 : train booking application names, url, logos
    var Section2Names : [String] = ["IRCTC", "Confirmtkt", "Makemy"]
    var Section2URL : [String] = ["https://www.gotrain.com","https://www.irctc.co.in","https://www.thetrainline.com"]
    var Section2Images : [String] = ["images", "unnamed", "Makemy.jpg"]
    
    //section 3 : movies booking application names, url, logos
    var Section3Names : [String] = ["BookMyShow", "Imax", "PVR "]
    var Section3URL : [String] = ["https://in.bookmyshow.com"," https://www.imax.com", " https://www.pvrcinemas.com"]
    var Section3Images : [String] = ["bm.Medi.jpeg", "imax.jpg.webp", "pvr.jpg.webp"]
    
    //section 4 : cab booking application names, url, logos
    var Section4Names : [String] = ["Ola", "Rapido", "Uber"]
    var Section4URL : [String] =  ["https://www.uber.com","https://www.olacabs.com","https://www.taxify.com"]
    var Section4Images : [String] = ["ola", "Rapido", "uber"]
    
    
    //section 5 : flight booking application names, url, logos
    var Section5Names : [String] = ["Indigo", "IXIGO", "Makemy"]
    var Section5URL : [String] = ["https://www.goindigo.in", "https://www.ixigo.com", "https://www.makemytrip.com"]
    var Section5Images : [String] = ["indigo.png", "IXIGO.png", "Makemy.jpg"]
    
    
    // Called when the view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
        //core animation for imageview
        imageviewLayer = image.layer
        imageviewLayer.borderColor = UIColor.black.cgColor
        imageviewLayer.borderWidth = 5
        imageviewLayer.cornerRadius = 25
        imageviewLayer.shadowRadius = 100
        imageviewLayer.shadowColor = UIColor.black.cgColor
        
        //core animation for webname label
        labelLayer = l1.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 5
        //labelLayer.backgroundColor = UIColor.purple.cgColor
        //core animation for weburl label
        labelLayer = l2.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 5
        //labelLayer.backgroundColor = UIColor.purple.cgColor
        //core animation for next button
        Button = b1.layer
        Button.borderColor = UIColor.black.cgColor
        Button.borderWidth = 2
        Button.cornerRadius = 5
        
        //Button.backgroundColor = UIColor.yellow.cgColor
        //core animation for screen view layer
        screenviewLayer = self.view.layer
        //screenviewLayer.borderColor = UIColor.systemPink.cgColor
        //screenviewLayer.borderWidth = 10
        screenviewLayer.cornerRadius = 50
        
        
        imageviewLayer = image.layer
        imageviewLayer.borderWidth = 6
        imageviewLayer.cornerRadius  = 40
        
        // Do any additional setup after loading the view.
        if table1 == nil {
            print("tableView is nil. Check storyboard connections.")
        } else {
            table1.delegate = self
            table1.dataSource = self
        }
    }
    
    //tableview protocol methods implementation
    //1.number of sections
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    //2.number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return Section1Names.count
        }else if section == 1 {
            return Section2Names.count
        }else if section == 2 {
            return Section3Names.count
        } else if section == 3 {
            return Section4Names.count
        } else {
            return Section5Names.count
        }
    }
    
    //3.title for header section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Bus"
        } else if section == 1 {
            return "Train"
        } else if section == 2 {
            return "Movie"
        } else if section == 3 {
            return "Cabs"
        } else {
            return "Flight"
        }
        
    }
    
    //4.title for footer section
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Buses End"
        } else if section == 1 {
            return "Trains End"
        } else if section == 2 {
            return "Movies End"
        } else if section == 3 {
            return "Cabs End"
        } else {
            return "Flight End"
        }
    }
    //5.display the info in cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = Section1Names[indexPath.row]
        } else if indexPath.section == 1 {
            
            cell.textLabel?.text = Section2Names[indexPath.row]
        } else if indexPath.section == 2 {
            
            cell.textLabel?.text = Section3Names[indexPath.row]
        } else if indexPath.section == 3 {
            
            cell.textLabel?.text = Section4Names[indexPath.row]
        } else {
            cell.textLabel?.text = Section5Names[indexPath.row]
        }
        cell.accessoryType = .detailDisclosureButton
        //cell.backgroundColor = .clear
        cell.tintColor = .black
        return cell
        
    }
    //6.height for header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    //7.height for footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    //8.whe user select any row in tableview
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            l1.text = Section1Names[indexPath.row]
            image.image = UIImage(named: Section1Images[indexPath.row])
            l2.text = Section1URL[indexPath.row]
        }
        else if indexPath.section == 1 {
            
            l1.text = Section2Names[indexPath.row]
            image.image = UIImage(named: Section2Images[indexPath.row])
            l2.text = Section2URL[indexPath.row]
        }
        else if indexPath.section == 2 {
            
            l1.text = Section3Names[indexPath.row]
            image.image = UIImage(named: Section3Images[indexPath.row])
            l2.text = Section3URL[indexPath.row]
        }
        else if indexPath.section == 3 {
            
            l1.text = Section4Names[indexPath.row]
            image.image = UIImage(named: Section4Images[indexPath.row])
            l2.text = Section4URL[indexPath.row]
        } else {
            l1.text = Section5Names[indexPath.row]
           image.image = UIImage(named: Section5Images[indexPath.row])
            l2.text = Section5URL[indexPath.row]
        }
        
    }
    //09.when user select any accesory detail button
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.section == 0 {
            l1.text = Section1Names[indexPath.row]
            image.image = UIImage(named: Section1Images[indexPath.row])
            l2.text = Section1URL[indexPath.row]
        }
        else if indexPath.section == 1 {
            l1.text = Section2Names[indexPath.row]
            image.image = UIImage(named: Section2Images[indexPath.row])
            l2.text = Section2URL[indexPath.row]
            
        }
        else if indexPath.section == 2 {
            l1.text = Section3Names[indexPath.row]
            image.image = UIImage(named: Section3Images[indexPath.row])
            l2.text = Section3URL[indexPath.row]
            
        }
        else if indexPath.section == 3 {
            l1.text = Section4Names[indexPath.row]
            image.image = UIImage(named: Section4Images[indexPath.row])
            l2.text = Section4URL[indexPath.row]
            
        }
        else {
            l1.text = Section5Names[indexPath.row]
            image.image = UIImage(named: Section5Images[indexPath.row])
            l2.text = Section5URL[indexPath.row]
        }
        
    }
    //10.section index titles
    func sectionIndexTitles(for tableView : UITableView) -> [String]? {
        let indexTitles = ["BUS","TRAIN","MOVIES","CABS","FLIGHT"]
        return indexTitles
    }
    
    
    
    // Defines an action triggered when the button is tapped.
    @IBAction func NextButtonClick() {
        guard let urlString = l2.text,!urlString.isEmpty, let url = URL(string: urlString), UIApplication.shared.canOpenURL(url)
        else {
            showAlert(title : "Error", message: "The URL is invalid or missing.")
            return
        }
        //defining actionsheet with multiple options like webview, safari
        let alert = UIAlertController(title: "Open url", message: "Please select an option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Webkit view", style: .default, handler: {_ in
            let secondVC = ThirdViewController()
            secondVC.url = url
            secondVC.title = self.l1.text
            secondVC.loadInWebView = true
            self.navigationController?.pushViewController(secondVC, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "safari view", style: .default, handler: { [weak self]_ in
            let secondVC = ThirdViewController()
            secondVC.url = url
            secondVC.title = self?.l1.text
            secondVC.loadInWebView = false
            self?.navigationController?.pushViewController(secondVC, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "cancel", style: .destructive, handler: { _ in
            print("user clicked cancel button..!")
        }))
        
        //display alert
        self.present(alert, animated: true, completion: nil)
        print("completion block")
    
    }
    // show alert function
    func showAlert(title : String, message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //tableview animation
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
            self.animateTable()
        }
        
    func animateTable() {
        table1.reloadData()
        let cells = table1.visibleCells
        let tableHeight: CGFloat = table1.bounds.size.height
       for i in cells {
         let cell: UITableViewCell = i as UITableViewCell
          cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
      }
       var index = 0
       for a in cells {
        let cell: UITableViewCell = a as UITableViewCell
           UIView.animate(withDuration: 1.5, delay: 0.09 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .allowAnimatedContent,
       animations: {
         cell.transform = CGAffineTransform(translationX: 0, y: 0);
       }, completion: nil)
       
       index += 1 }
      }
    
    
}


















//import UIKit
//import SafariServices
//import WebKit
//
//class SecondViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
//    @IBOutlet var table1 : UITableView!
//    
//    @IBOutlet var wb1 : WKWebView!
//    
//    @IBOutlet var l1: UILabel!
//    @IBOutlet var l2: UILabel!
//    
//    @IBOutlet var image: UIImageView!
//    
//    @IBOutlet var b1: UIButton!
//    
//    
//    var Section1 : [String] = []
//    var Section2 : [String] = []
//    var Section3 : [String] = []
//    var Section4 : [String] = []
//    
//    
//    var Section1image : [String] = []
//    var Section2image : [String] = []
//    var Section3image : [String] = []
//    var Section4image : [String] = []
//    
//    
//    var Section1URL : [String] = []
//    var Section2URL : [String] = []
//    var Section3URL : [String] = []
//    var Section4URL : [String] = []
//    
//    var  imageViewLayer: CALayer!
//    
//    var url: URL!
//    
//    var request: URLRequest!
//    
//    var web1 : WKWebView!
//    var check: URL?
//    
//    var text: String?
//    var loadInWebView: Bool = false
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        Section1 = ["RED BUS", "ABHI BUS", "MAKEMY TRIP"]
//        Section1image = ["red", "Abhi-2", "Makemy.jpg"]
//        Section1URL = ["https://www.redbus.in", "https://www.abhibus.com", "https://www.makemytrip.com"]
//        
//        Section2 = ["OLA", "RAPIDO", "UBER"]
//        Section2image = ["ola", "Rapido", "uber"]
//        Section2URL = ["https://www.ola.com", "https://www.rapido.com", "https://www.uber.com"]
//        
//        Section3 = ["IRCTC", "CONFIRMTKT", "MAKEMY TRIP"]
//        Section3image = ["images", "unnamed", "Makemy.jpg"]
//        Section3URL = ["https://www.irctc.co.in", "https://www.confirmtkt.com", "https://www.makemytrip.com"]
//        
//        Section4 = ["INDIGO", "IXIGO", "MAKEMY TRIP"]
//        Section4image = ["indigo", "IXIGO.png", "Makemy.jpg"]
//        Section4URL = ["https://www.goindigo.in", "https://www.ixigo.com", "https://www.makemytrip.com"]
//        
//        
////        imageViewLayer = image.layer
////        imageViewLayer.borderWidth = 6
////        imageViewLayer.cornerRadius  = 40
//        
//        
//        table1.delegate = self
//        table1.dataSource = self
//        
//        
//        //
//        
//    }
//    //tableview protocol methods implementation
//    //1.number of sections
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
//    }
//    
//    // Remaining Section Code for Sections 3 and 4
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:return Section1.count
//        case 1:return Section2.count
//        case 2: return Section3.count
//        case 3:return Section4.count
//        default:
//            return 0
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.section {
//        case 0:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
//            cell.textLabel?.text = Section1[indexPath.row]
//            cell.textLabel?.textColor = .white
//            cell.accessoryType = .detailDisclosureButton
//            cell.tintColor = .white
//            cell.backgroundColor = .black
//            
//            return cell
//            
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
//            cell.textLabel?.text = Section2[indexPath.row]
//            cell.textLabel?.textColor = .white
//            cell.accessoryType = .detailDisclosureButton
//            cell.tintColor = .white
//            cell.backgroundColor = .black
//            return cell
//            
//        case 2:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
//            cell.textLabel?.text = Section3[indexPath.row]
//            cell.textLabel?.textColor = .white
//            cell.accessoryType = .detailDisclosureButton
//            cell.tintColor = .white
//            cell.backgroundColor = .black
//            return cell
//            
//        case 3:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
//            cell.textLabel?.text = Section4[indexPath.row]
//            cell.textLabel?.textColor = .white
//            cell.tintColor = .white
//            cell.accessoryType = .detailDisclosureButton
//            cell.backgroundColor = .black
//            return cell
//            
//        default:
//            return UITableViewCell()
//        }
//        
//    }
//    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//            if indexPath.section == 0{
//    
//               l1.text = Section1[indexPath.row]
//                image.image = UIImage(named: Section1image[indexPath.row])
//                l2.text = Section1URL[indexPath.row]
//            }
//            else if indexPath.section == 1 {
//                l1.text = Section2[indexPath.row]
//                image.image = UIImage(named: Section2image[indexPath.row])
//                l2.text = Section2URL[indexPath.row]
//            }
//            else if indexPath.section == 2 {
//                l1.text = Section3[indexPath.row]
//                image.image = UIImage(named: Section3image[indexPath.row])
//                l2.text = Section3URL[indexPath.row]
//        }
//        else if indexPath.section == 3 {
//            l1.text = Section4[indexPath.row]
//            image.image = UIImage(named: Section4image[indexPath.row])
//            l2.text = Section4URL[indexPath.row]
//        }
//            
//        }
//    
//    
//    let sectionTitles = ["Bus Apps", "Car Apps", "Train Apps", "Flight Apps"]
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        guard section >= 0 && section < sectionTitles.count else {
//            return nil
//        }
//        return sectionTitles[section]
//    }
//    
//    
//     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch indexPath.section {
//        case 0:
//            l1.text = Section1[indexPath.row]
//            image.image = UIImage(named: Section1image[indexPath.row])
//            l2.text = Section1URL[indexPath.row]
//        case 1:
//            l1.text = Section2[indexPath.row]
//            image.image = UIImage(named: Section2image[indexPath.row])
//            l2.text = Section2URL[indexPath.row]
//        case 2:
//            l1.text = Section3[indexPath.row]
//            image.image = UIImage(named: Section3image[indexPath.row])
//            l2.text = Section3URL[indexPath.row]
//        case 3:
//            l1.text = Section4[indexPath.row]
//            image.image = UIImage(named: Section4image[indexPath.row])
//            l2.text = Section4URL[indexPath.row]
//        default:
//            break
//        }
//    }
//    @IBAction func NextButtonClick(){
//  
//  
//              let actionSheet = UIAlertController(title: "Choose Option", message: "Select an option to proceed", preferredStyle: .actionSheet)
//  
//  
//  
//  
//              actionSheet.addAction(UIAlertAction(title: "Safari", style: .default, handler: { (_) in
//                  print("User click to open Safari button")
//                  print("\(self.l2.text!)")
//                 if let urlString = self.l2.text, // Get the URL string from the label
//                     let url = URL(string: urlString) { // Convert to URL
//                     let safariVC = SFSafariViewController(url: url)
//                     self.present(safariVC, animated: true, completion: nil)
//                 }
//  
//             }))
//  
//  
//                     let webViewButton = UIAlertAction(title: "WebView", style: .default, handler: { _ in
//  
//                         let selectedWebsiteURL = self.l2.text!
//  
//                            if let url = URL(string: selectedWebsiteURL) {
//
//                                let webViewController = ThirdViewController(websiteURL:url)
//  
//         
//                                  webViewController.navigationItem.title = self.l1.text
//  
//                                 self.navigationController?.pushViewController(webViewController, animated: true)
//                       } else {
//                             let alert = UIAlertController(title: "No Website Selected",
//                                                            message: "Please select a website before proceeding.",
//                                                            preferredStyle: .alert)
//                              alert.addAction(UIAlertAction(title: "OK", style: .default))
//                             self.present(alert, animated: true)
//  
//                          }
//                     })
//                      actionSheet.addAction(webViewButton)
//             actionSheet.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (_) in
//                 print("User click Cancle button")
//             }))
// 
// 
//  
//            self.present(actionSheet, animated: true, completion: {
//                 print("completion block")
//             })
//         }
//    //tableview animation
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.animateTable()
//    }
//    
//    func animateTable() {
//        table1.reloadData()
//        let cells = table1.visibleCells
//        let tableHeight: CGFloat = table1.bounds.size.height
//        for i in cells {
//            let cell: UITableViewCell = i as UITableViewCell
//            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
//        }
//        var index = 0
//        for a in cells {
//            let cell: UITableViewCell = a as UITableViewCell
//            UIView.animate(withDuration: 1.5, delay: 0.09 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .allowAnimatedContent,
//                           animations: {
//                cell.transform = CGAffineTransform(translationX: 0, y: 0);
//            }, completion: nil)
//            
//            index += 1 }
//    }
//    
//    }
