//
//  ButtonsView.swift
//  Projet_5
//
//  Created by Léo NICOLAS on 08/04/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import UIKit

// Class representing the view with the 3 buttons
class ButtonsView: UIView {
    
    
    // Properties
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    // Method that is called when the first button is pressed
    @IBAction func tapButton1(_ sender: Any) {
        button1.setImage(UIImage(named: "Selected"), for: .normal)
        button2.setImage(nil, for: .normal)
        button3.setImage(nil, for: .normal)
        
        let name = Notification.Name("Button1Recognizer")
        let notification = Notification(name: name)
        NotificationCenter.default.post(notification)
    }
    
    // Method that is called when the second button is pressed
    @IBAction func tapButton2(_ sender: Any) {
        button2.setImage(UIImage(named: "Selected"), for: .normal)
        button1.setImage(nil, for: .normal)
        button3.setImage(nil, for: .normal)
        
        let name = Notification.Name("Button2Recognizer")
        let notification = Notification(name: name)
        NotificationCenter.default.post(notification)
    }
    
    // Method that is called when the third button is pressed
    @IBAction func tapButton3(_ sender: Any) {
        button3.setImage(UIImage(named: "Selected"), for: .normal)
        button1.setImage(nil, for: .normal)
        button2.setImage(nil, for: .normal)
        
        let name = Notification.Name("Button3Recognizer")
        let notification = Notification(name: name)
        NotificationCenter.default.post(notification)
    }


}
