//
//  customViewController.swift
//  ASSMENT2
//
//  Created by FCI on 28/11/24.
//

import UIKit

class customViewController: UIViewController {
    
    
    
    @IBOutlet var display: UIImageView!
    @IBOutlet var Description: UITextView!
    
    var image1: UIImage!
    var string1: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        Description.text = string1
        display.image = image1
        
        if let fileName = string1 {
            loadTextFromFile(fileName)
        }
        
    }
    func loadTextFromFile(_ fileName: String) {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: nil) {
            do {
                let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)
                Description.text = fileContent
            } catch {
                // Handle error if file reading fails
                print("Error loading text file: \(error)")
            }
        }
    }
}
