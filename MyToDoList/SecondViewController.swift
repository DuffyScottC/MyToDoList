//
//  SecondViewController.swift
//  MyToDoList
//
//  Created by Scott on 8/11/16.
//  Copyright © 2016 Brosnappedfink. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var itemTextField: UITextField!
    
    @IBAction func add(_ sender: AnyObject) {
        
        //First we need to initially set "items" as an array of strings
        var items: [String]
        
        //So we're either adding on the contents of the textfield to the existing array, or we are creating a new array
        
        //1
        let itemsObject = UserDefaults.standard.object(forKey: "items") //Second let's attempt to pull the array from memory
        //2
        if let tempItems = itemsObject as? [String]/*an array of strings*/ { //Third We can use this to check if pulling the array was successful.
            
            //If that worked just above, we can let
            items = tempItems
            
            //3
            items.append(itemTextField.text!) //add an item 
            
            
        } else { //4
            //If that was not successful above
            
            items = [itemTextField.text!]
            
        }
        
        //Now we need to save "items"
        UserDefaults.standard.set(items, forKey: "items")
        
        //Now that we've saved these items, we need to do something similar in the FirstViewController. See viewDidLoad
        
        itemTextField.text = "" //Allow the user to do this again easily
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

