//
//  customTableViewController.swift
//  ASSMENT2
//
//  Created by FCI on 28/11/24.
//

import UIKit

class customTableViewController: UITableViewController {
    
    
    var Veg: [String] = []
    var VegImages: [String] = []
    var RecipeDetails: [String] = []
    
    
    var NonVeg: [String] = []
    var NonVegImages: [String] = []
    var NonRecipeDetails: [String] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Veg = ["Paneer Curry","Potato Curry","Tamato Curry"]
        VegImages = ["paneer","potato","tamato"]
        RecipeDetails = ["paneer.txt","potato.txt","tamato.txt"]
 
        
        
        NonVeg = ["Mutton Biryani","Fish Curry","Prawns Fry"]
        NonVegImages = ["biryani","fish","prawns"]
        NonRecipeDetails = ["biryani.txt","fish.txt","prawns.txt"]
 
        
        
        
        
    }
    
    
    
    //1 method no of section
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    
    //2 no of rows and assign section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if section == 0 {
            return Veg.count
        }else {
            return NonVeg.count
        }
    }
            
    
    // 3 display row info
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell1.textLabel?.text = Veg[indexPath.row]
            cell1.accessoryType = .detailDisclosureButton
            
            
            return cell1
            
            
        }else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            cell2.textLabel?.text = NonVeg[indexPath.row]
            cell2.accessoryType = .detailDisclosureButton
            return cell2
            
            
            
        }
    }
    
    
    // 4. header title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "VEG RECIPES"
        }else {
            return "NON VEG RECIPIES"
        }
    }
    
    
    
    //5. Footer title
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "VEG RECIPES END"
        }else {
            return "NON VEG RECIPIES END"
        }
    }

        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let nextScreen = storyboard.instantiateViewController(withIdentifier: "storyid1") as! customViewController
        
        
        if indexPath.section == 0 {
            
            nextScreen.title = Veg[indexPath.row]
            nextScreen.string1 = RecipeDetails[indexPath.row]
            nextScreen.image1 = UIImage(named: VegImages[indexPath.row])!
            
            
        } else {
            
            nextScreen.title = NonVeg[indexPath.row]
            nextScreen.string1 = NonRecipeDetails[indexPath.row]
            nextScreen.image1 = UIImage(named: NonVegImages[indexPath.row])!
        }
        self.navigationController?.pushViewController(nextScreen, animated: true)
        
        
    }

    
    
    
    }

    
    



    

    

   


