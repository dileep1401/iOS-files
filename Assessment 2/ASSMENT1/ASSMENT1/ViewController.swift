//
//  ViewController.swift
//  ASSMENT1
//
//  Created by FCI on 28/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var txt1: UITextField!
    @IBOutlet var txt2: UITextField!
    
    var url1: URL!
    var request1: URLRequest!
    
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func ClickButtonBrowse(_ sender: UIButton) {
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextScreen = segue.destination as! customViewController
        
        nextScreen.title = txt1.text
        
        if let webText = txt2.text, let url1 = URL(string: webText) {

            var request = URLRequest(url: url1)
            
            nextScreen.check = request
        } else {
            print("Invalid URL in txt2")
        }
    }

}

