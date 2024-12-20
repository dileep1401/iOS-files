import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var tf1 : UITextField!
        @IBOutlet var tf2 : UITextField!
        @IBOutlet var tf3 : UITextField!
        @IBOutlet var tf4 : UITextField!
        @IBOutlet var tf5 : UITextField!
        @IBOutlet var label1: UILabel!
        @IBOutlet var label2 : UILabel!
        @IBOutlet var b1: UIButton!
        @IBOutlet var b2: UIButton!
        
        var defaults1: UserDefaults!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tf1.delegate = self
                tf2.delegate = self
                tf3.delegate = self
                tf4.delegate = self
                tf5.delegate = self
        
        defaults1 = UserDefaults.standard
                tf1.text = defaults1.string(forKey: "username")
                tf2.text = defaults1.string(forKey: "userpassword")
                tf3.text=defaults1.string(forKey: "useremail")
                tf4.text=defaults1.string(forKey: "userphoneNumber")
                tf5.text=defaults1.string(forKey: "usercity")
            }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
            tf1.resignFirstResponder()
            tf2.resignFirstResponder()
            tf3.resignFirstResponder()
            tf4.resignFirstResponder()
            tf5.resignFirstResponder()
        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        @IBAction func b1lick() {
            
            defaults1 = UserDefaults.standard
            defaults1.set(tf1.text, forKey: "username")
            defaults1.set(tf2.text, forKey: "userpassworrd")
            defaults1.set(tf3.text, forKey: "useremail")
            defaults1.set(tf4.text, forKey: "userphoneNumber")
            defaults1.set(tf5.text, forKey: "usercity")
            defaults1.synchronize()
            
        }
    
    @IBAction func b2lick() {
            
            label2.text=String(describing:tf1.text!+" ") + (String(describing:tf2.text!+" ") + (String(describing:tf3.text!+" ") + (String(describing:tf4.text!+" ") + (String(describing:tf5.text!+" ")))))
            
        }
    }
