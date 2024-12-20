//
//  customViewController.swift
//  ASSMENT1
//
//  Created by FCI on 28/11/24.
//

import UIKit
import WebKit


class customViewController: UIViewController {
    
    
    @IBOutlet var browse: WKWebView!
    
    var check: URLRequest?!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let request = check {
            browse.load(request!)
        } else {
            print("No URLRequest to load")
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

}
