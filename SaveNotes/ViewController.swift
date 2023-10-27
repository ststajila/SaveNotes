//
//  ViewController.swift
//  SaveNotes
//
//  Created by STANISLAV STAJILA on 10/26/23.
//

import UIKit

public class Player: Codable{
    var name: String
    var score: Int
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}


class ViewController: UIViewController {
    
    @IBOutlet weak var scoreInput: UITextField!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    
    //Step 1
    // creating a reference to the phone creating a variable you can save to
    let defaults = UserDefaults.standard
    var name = ""

    @IBOutlet weak var labelOutlet: UILabel!
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    var highestScore = -1
    var previousScore = -1
    var globalPlayer = Player(name: "John", score: 0)
    
    @IBOutlet weak var playerLabel: UILabel!
    
    
    @IBOutlet weak var NameOutlet: UITextField!
    
    @IBOutlet weak var ageOutlet: UITextField!
    
   
    override func viewDidLoad() {
        //Step 3
        super.viewDidLoad()
        
        //getting the value from the phone
        name = defaults.string(forKey: "theName") ?? ""
        labelOutlet.text = name
        
        highestScore = defaults.integer(forKey: "point") ?? -1
        
        var temp = defaults.object(forKey: "player")
        if let t = temp as? Player{
            globalPlayer = t
        }
        
        
        
        if let items = defaults.data(forKey: "points") {
                        let decoder = JSONDecoder()
                        if let decoded = try? decoder.decode([Contact].self, from: items) {
                            contacts = decoded
                        }
                }
        
        
        playerLabel.text = "\(globalPlayer.name) - \(globalPlayer.score)"
    }

    @IBAction func buttonAction(_ sender: Any) {
        
       var text = textFieldOutlet.text!
        //Step 2
        //saving to the phone
        defaults.set(text, forKey: "theName")
        let myScore = scoreInput.text 
        
    }
    
    
    @IBAction func clickAction(_ sender: Any) {
        let c = Int(scoreInput.text!) ?? -1
        if c >= 0 {
            if previousScore < c{
                defaults.setValue(c, forKey: "points")
                pointsLabel.text = "\(previousScore)"
            }
        }
        
        }
    
    
    @IBAction func savePlayer(_ sender: Any) {
    
        var name = NameOutlet.text!
        var score = ageOutlet.text!
        
        if let p = Int(score){
            var player = Player(name: name, score: p)
            let encoder = JSONEncoder()
               if let encoded = try? encoder.encode(contacts) {
                   defaults.set(encoded, forKey: "player")
                            }
            
            
        }
        
        
    }
    
}
    

