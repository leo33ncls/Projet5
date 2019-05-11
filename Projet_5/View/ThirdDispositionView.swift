//
//  ThirdDispositionView.swift
//  Projet_5
//
//  Created by Léo NICOLAS on 18/04/2019.
//  Copyright © 2019 Léo NICOLAS. All rights reserved.
//

import UIKit

// Class representing the third disposition view
class ThirdDispositionView: UIView {
    
    
    //=================
    // Properties
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var fourthImageView: UIImageView!
    
    // A boolean to know if the view is ready to be shared
    var isReadyToBeShared: Bool {
        if firstImageView.image == UIImage(named: "Cross") || secondImageView.image == UIImage(named: "Cross") || thirdImageView.image == UIImage(named: "Cross") || fourthImageView.image == UIImage(named: "Cross") {
            return false
        } else {
            return true
        }
    }
    
    // The imageView selected
    private var imageViewSelected: UIImageView?
    
    
    //=================
    // Overriding
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageViewRecognizer()
    }
    
    
    //=================
    // Methods
    
    // Method which add the gesture recognizer for the imageView
    private func imageViewRecognizer() {
        firstImageView.isUserInteractionEnabled = true
        secondImageView.isUserInteractionEnabled = true
        thirdImageView.isUserInteractionEnabled = true
        fourthImageView.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sendNotification))
        firstImageView.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(sendNotification2))
        secondImageView.addGestureRecognizer(tapGestureRecognizer2)
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(sendNotification3))
        thirdImageView.addGestureRecognizer(tapGestureRecognizer3)
        
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(sendNotification4))
        fourthImageView.addGestureRecognizer(tapGestureRecognizer4)
    
    }
    
    
    // Method that sends a notification when the first imageView is tapped
    @objc private func sendNotification() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = firstImageView
    }
    
    // Method that sends a notification when the second imageView is tapped
    @objc private func sendNotification2() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = secondImageView
    }
    
    // Method that sends a notification when the third imageView is tapped
    @objc private func sendNotification3() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = thirdImageView
    }
    
    // Method that sends a notification when the fourth imageView is tapped
    @objc private func sendNotification4() {
        let name = Notification.Name("TapGestureRecognizer")
        let notification = Notification(name: name)
        
        NotificationCenter.default.post(notification)
        
        imageViewSelected = fourthImageView
    }
    
    
    // Method which give the image to the selected imageView
    func setImage(image: UIImage) {
        imageViewSelected?.clipsToBounds = true
        imageViewSelected?.contentMode = .scaleAspectFill
        imageViewSelected?.image = image
    }
    
    
    // Method which reset the view
    func resetView() {
        firstImageView.image = UIImage(named: "Cross")
        secondImageView.image = UIImage(named: "Cross")
        thirdImageView.image = UIImage(named: "Cross")
        fourthImageView.image = UIImage(named: "Cross")
    }
  
}
