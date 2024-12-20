//
//  ThirdViewController.swift
//  PROJRCT
//
//  Created by FCI on 13/12/24.
//

// Imports the UIKit framework, which provides the necessary infrastructure for iOS apps.
import UIKit
import WebKit
import SafariServices

// Defines a ViewController class that manages the app's user interface.
class ThirdViewController: UIViewController {
    var url : URL!
    var request : URLRequest!
    var loadInWebView: Bool = false
    @IBOutlet var webView: WKWebView!
    var homeButton1 : UIBarButtonItem!
    
    // Called when the view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        //home button implementation
        homeButton1 = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(homeButton1Click))
        self.navigationItem.rightBarButtonItem = homeButton1
        homeButton1.tintColor = .white
        if let url = url {
            loadInWebView(url: url)
        }
    }
    //function for loading webview and safari
    func loadInWebView(url: URL) {
        if webView == nil {
            webView = WKWebView(frame: self.view.bounds)
            webView.load(URLRequest(url: url))
            self.view.addSubview(webView)
        }
        else {
            let safariVC = SFSafariViewController(url: url)
            self.present(safariVC, animated: true, completion: nil)
            }
        }
    // function for home button
    @objc func homeButton1Click() {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
