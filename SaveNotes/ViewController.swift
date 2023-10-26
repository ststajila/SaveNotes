//
//  ViewController.swift
//  SaveNotes
//
//  Created by STANISLAV STAJILA on 10/26/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreInput: UITextField!
    //Step 1
    // creating a reference to the phone creating a variable you can save to
    let defaults = UserDefaults.standard
    var name = ""

    @IBOutlet weak var labelOutlet: UILabel!
    
    @IBOutlet weak var textFieldOutlet: UITextField!
   
    override func viewDidLoad() {
        //Step 3
        super.viewDidLoad()
        
        //getting the value from the phone
        name = defaults.string(forKey: "theName") ?? ""
        labelOutlet.text = name
    }

    @IBAction func buttonAction(_ sender: Any) {
        
       var text = textFieldOutlet.text!
        //Step 2
        //saving to the phone
        defaults.set(text, forKey: "theName")
        let myScore = scoreInput.text 
        
    }
    
}

